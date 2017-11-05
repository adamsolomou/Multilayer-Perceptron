#include "layer.hpp"

class ClusteredLayer
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

    ClusteredLayer(
        unsigned nIn,
        unsigned nOut,
        const std::vector<synapse_t> &synapses
    )
        : m_nIn(nIn)
        , m_nOut(nOut)
        , m_synapses(synapses)
        , dst_nodes(m_nOut) 
    {   
        //std::vector<my_struct> dst_nodes(m_nOut);
        for(unsigned i=0; i<m_synapses.size(); i++){
            w_s_pair tmp; //declare a temporary variable 
            tmp.w = m_synapses[i].weight; 
            tmp.s = m_synapses[i].src; 

            dst_nodes[ m_synapses[i].dst ].edges.push_back(tmp); 
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
        //std::vector<int32_t> acc(m_nOut, 0); // Create a working vector

        for(unsigned i=0; i<m_nOut; i++){ //loop over destination nodes 
            int32_t acc = 0; //accumulation variable 
            for(unsigned j=0; j<dst_nodes[i].edges.size(); j++){ //edges for this destination 
                //Calculate contribution for each weight/source pair 
                int32_t contrib = dst_nodes[i].edges[j].w * pIn[ dst_nodes[i].edges[j].s ]; 

                //Add into acc varible with 16 fractional bits
                acc += contrib >> (23-16);
            }
            pOut[i] = sigmoid(acc); //compress with sigmoid
        }
    }
};

LayerPtr CreateClusteredLayer(unsigned nIn, unsigned nOut, const std::vector<synapse_t> &synapses)
{
    return std::make_shared<ClusteredLayer>(nIn, nOut, synapses);
}
