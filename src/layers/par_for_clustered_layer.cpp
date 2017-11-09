#include "layer.hpp"
#include "tbb/parallel_for.h"

class ParForClusteredLayer
    : public Layer
{
protected:
    unsigned m_nIn;
    unsigned m_nOut;

    std::vector<synapse_t> m_synapses;
public:
    struct w_s_pair
    {
        int32_t w; //weight
        uint16_t s; //source (src)
    };

    struct my_struct
    {
        //uint16_t dst; //output (dst) neuron 
        std::vector<w_s_pair> edges;  
    };

    std::vector<my_struct> dst_nodes;

    ParForClusteredLayer(
        unsigned nIn,
        unsigned nOut,
        const std::vector<synapse_t> &synapses
    )
        : m_nIn(nIn)
        , m_nOut(nOut)
        , m_synapses(synapses)
        , dst_nodes(m_nOut) 
    {   
        w_s_pair tmp; //declare a temporary variable 
        tmp.w = 0; 
        tmp.s = 0; 

        std::vector<w_s_pair> v_tmp(m_nIn, tmp);

        for(unsigned i=0; i<m_nOut; i++){

            dst_nodes[i].edges = v_tmp; 
        } 

        std::vector<int32_t> counters(m_nOut, 0);
        //std::vector<bool> reserved(m_nOut, false); 

        for(unsigned i=0; i<m_synapses.size(); i++){
            // if(!reserved[m_synapses[i].dst]){
            //     dst_nodes[i].edges.reserve(m_nIn);
            //     reserved[ m_synapses[i].dst ] = true; 
            // }
            w_s_pair tmp; //declare a temporary variable 
            tmp.w = m_synapses[i].weight; 
            tmp.s = m_synapses[i].src; 

            dst_nodes[ m_synapses[i].dst ].edges[ counters[ m_synapses[i].dst] ] = tmp;

            counters[ m_synapses[i].dst ] += 1; 

            //dst_nodes[ m_synapses[i].dst ].edges.emplace_back(tmp); 
        }
    }
    const char *name() const
    { return "simple"; }
    
    virtual unsigned input_size() const
    { return m_nIn; }
    
    virtual unsigned output_size() const
    { return m_nOut; }
    
    void execute(
        const int8_t *pIn,  // Values of input neurons in -127..+127
        int8_t *pOut        // Values of output neurons in -127..+127
    ) const
    {        
        tbb::parallel_for(0u, m_nOut, [&](unsigned i){
            int32_t acc = 0; //accumulation variable 
            for(unsigned j=0; j<dst_nodes[i].edges.size(); j++){ //edges for this destination 
                //Calculate contribution for each weight/source pair 
                int32_t contrib = dst_nodes[i].edges[j].w * pIn[ dst_nodes[i].edges[j].s ]; 

                //Add into acc varible with 16 fractional bits
                acc += contrib >> (23-16);
            }
            pOut[i] = sigmoid(acc); //compress with sigmoid
        });
    }
};

LayerPtr CreateParForClusteredLayer(unsigned nIn, unsigned nOut, const std::vector<synapse_t> &synapses)
{
    return std::make_shared<ParForClusteredLayer>(nIn, nOut, synapses);
}
