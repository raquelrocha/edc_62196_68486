﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LojaCT.GetDump {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="GetDump.GetDumpSoap")]
    public interface GetDumpSoap {
        
        // CODEGEN: Generating message contract since element name GetProductsXMLResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetProductsXML", ReplyAction="*")]
        LojaCT.GetDump.GetProductsXMLResponse GetProductsXML(LojaCT.GetDump.GetProductsXMLRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetProductsXML", ReplyAction="*")]
        System.Threading.Tasks.Task<LojaCT.GetDump.GetProductsXMLResponse> GetProductsXMLAsync(LojaCT.GetDump.GetProductsXMLRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetProductsJSON", ReplyAction="*")]
        void GetProductsJSON();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetProductsJSON", ReplyAction="*")]
        System.Threading.Tasks.Task GetProductsJSONAsync();
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetProductsXMLRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetProductsXML", Namespace="http://tempuri.org/", Order=0)]
        public LojaCT.GetDump.GetProductsXMLRequestBody Body;
        
        public GetProductsXMLRequest() {
        }
        
        public GetProductsXMLRequest(LojaCT.GetDump.GetProductsXMLRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class GetProductsXMLRequestBody {
        
        public GetProductsXMLRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetProductsXMLResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetProductsXMLResponse", Namespace="http://tempuri.org/", Order=0)]
        public LojaCT.GetDump.GetProductsXMLResponseBody Body;
        
        public GetProductsXMLResponse() {
        }
        
        public GetProductsXMLResponse(LojaCT.GetDump.GetProductsXMLResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetProductsXMLResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public System.Xml.Linq.XElement GetProductsXMLResult;
        
        public GetProductsXMLResponseBody() {
        }
        
        public GetProductsXMLResponseBody(System.Xml.Linq.XElement GetProductsXMLResult) {
            this.GetProductsXMLResult = GetProductsXMLResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface GetDumpSoapChannel : LojaCT.GetDump.GetDumpSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class GetDumpSoapClient : System.ServiceModel.ClientBase<LojaCT.GetDump.GetDumpSoap>, LojaCT.GetDump.GetDumpSoap {
        
        public GetDumpSoapClient() {
        }
        
        public GetDumpSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public GetDumpSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public GetDumpSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public GetDumpSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        LojaCT.GetDump.GetProductsXMLResponse LojaCT.GetDump.GetDumpSoap.GetProductsXML(LojaCT.GetDump.GetProductsXMLRequest request) {
            return base.Channel.GetProductsXML(request);
        }
        
        public System.Xml.Linq.XElement GetProductsXML() {
            LojaCT.GetDump.GetProductsXMLRequest inValue = new LojaCT.GetDump.GetProductsXMLRequest();
            inValue.Body = new LojaCT.GetDump.GetProductsXMLRequestBody();
            LojaCT.GetDump.GetProductsXMLResponse retVal = ((LojaCT.GetDump.GetDumpSoap)(this)).GetProductsXML(inValue);
            return retVal.Body.GetProductsXMLResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<LojaCT.GetDump.GetProductsXMLResponse> LojaCT.GetDump.GetDumpSoap.GetProductsXMLAsync(LojaCT.GetDump.GetProductsXMLRequest request) {
            return base.Channel.GetProductsXMLAsync(request);
        }
        
        public System.Threading.Tasks.Task<LojaCT.GetDump.GetProductsXMLResponse> GetProductsXMLAsync() {
            LojaCT.GetDump.GetProductsXMLRequest inValue = new LojaCT.GetDump.GetProductsXMLRequest();
            inValue.Body = new LojaCT.GetDump.GetProductsXMLRequestBody();
            return ((LojaCT.GetDump.GetDumpSoap)(this)).GetProductsXMLAsync(inValue);
        }
        
        public void GetProductsJSON() {
            base.Channel.GetProductsJSON();
        }
        
        public System.Threading.Tasks.Task GetProductsJSONAsync() {
            return base.Channel.GetProductsJSONAsync();
        }
    }
}
