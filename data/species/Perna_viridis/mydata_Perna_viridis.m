function [data, auxData, metaData, txtData, weights] = mydata_Perna_viridis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Perna_viridis'; 
metaData.species_en = 'Green mussel'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPSE', 'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L', 't-Wd', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jonathan Flye-Sainte-Marie'};    
metaData.date_subm = [2011 04 01];              
metaData.email    = {'jonathan.flye@univ-brest.fr'};            
metaData.address  = {'Brest University'};   

metaData.author_mod_1  = {'Katie McFarland'};        
metaData.date_mod_1    = [2015 04 20];             
metaData.email_mod_1   = {'mcfarland.316@gmail.com'};     
metaData.address_mod_1 = {'University of Brest'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2015 12 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2016 10 26];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Martin Cheng', 'Antonio Giacoletti'};    
metaData.date_mod_3     = [2018 02 01];              
metaData.email_mod_3    = {'kazukicheng@gmail.com'};            
metaData.address_mod_3  = {'The Swire Institute of Marine Science, The University of Hong Kong, Hong Kong'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 02 02]; 

%% set data
% zero-variate data

data.ab = 0.9;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LaxmRao2011';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 12;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Tan1975';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 75;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'RajaVenu2006';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';  %changed with the average between the reported 60-90 value
data.am = 1825;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Cheng2016'; %changed from 1200 to 1825
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.008;units.Lb  = 'cm';  label.Lb  = 'shell lenght at birth';   bibkey.Lb  = 'LaxmRao2011';
  comment.Lb = 'shell lenght is from umbo to ventral margin';
data.Lj  = 0.04; units.Lj  = 'cm';  label.Lj  = 'shell lenght at metam';   bibkey.Lj  = 'Tan1975';
data.Lp  = 1.5;  units.Lp  = 'cm';  label.Lp  = 'shell lenght at puberty'; bibkey.Lp  = 'RajaVenu2006';
data.Li  = 23;   units.Li  = 'cm';  label.Li  = 'ultimate shell lenght';   bibkey.Li  = 'Appukuttan1977';

data.Wdb = 3e-8; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'guess';
  comment.Wdb = 'from Mytilid species files';
data.Wdj = 3e-6; units.Wdj = 'g';   label.Wdj = 'dry weight at metam';     bibkey.Wdj = 'guess';
  comment.Wdj = 'from Mytilid species files';
data.Wdp = 0.03; units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'McFa2015';
  comment.Wdp = 'field results';
data.Wdi = 28;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'McFa2015';
  comment.Wdi = 'field results';

data.Ri  = 159000;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'McFa2015';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Laboratory results';
 
% uni-variate data
% t-L data
data.tL =   [ ...    % time since birth (d), shell lenght (cm)
	47              2.4051429599;
	78.345980939	3.41988850926;
	105.222442007	4.19528861716;
	138.292033807	6.02049991009;
	167.8766408921	6.64520769646;
	197.4747347601	7.11976263262;
	227.97914044253	7.50404603489;
	260.242222622	8.30839777019;
	288.9501888151	8.69304082;
	319.4707786371	8.89714080201;
	350.897680273	9.01096925013;
	379.516633699	10.3866211113];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell lenght'};  
temp.tL    = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ScreThan1989';
%
%  Age(years)-Length(cm) relationships obtained by aging shells
%  collected from Hong Kong population (Three Fathoms Cove) during the period (2014-2015).
data.tL2 = [ ... % time (yr), length (cm)
1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	5	5	5	5	5	5	5	5;
2.55	3.87	2.89	2.47	4.60	4.45	4.81	5.33	2.02	2.55	2.84	2.98	3.89	3.81	2.91	3.37	3.57	3.32	3.73	3.26	5.33	5.33	5.33	5.20	3.76	3.24	5.37	5.38	4.45	5.25	5.30	5.17	5.90	5.60	5.33	5.33	5.14	4.98	5.09	5.33	5.18	3.45	3.99	7.06	4.54	5.44	3.87	2.95	5.06	6.45	4.98	5.09	5.33	5.18	3.45	5.58	3.99	4.54	5.44	2.95	5.06	5.33	5.75	5.44	7.22	5.33	5.97	5.33	5.31	5.38	5.81	5.19	5.60	5.21	4.97	5.33	5.51	7.94	6.23	6.30	5.72	6.49	5.33	6.01	5.64	5.50	6.22	4.97	5.65	5.26	6.96	6.52	5.56	6.42	6.00	5.95	5.50	4.99	5.56	4.96	5.06	5.77	5.65	5.72	5.60	6.76	6.04	7.43	6.83	5.95	6.39	6.52	5.33	7.69	6.28	8.04	5.33	7.54	7.48	5.58	8.04	5.33	7.48	7.06	7.55	8.69	6.87	8.95	7.84	7.66	8.02	9.83	8.43	8.79	7.78	8.82	7.00	7.47	8.22	7.93	8.55	7.59	8.80	7.94	8.99	5.33	7.54	5.33	9.02	8.56	8.58	8.32	8.43	7.91	7.84	8.62	9.48	8.10	10.12	9.82	8.79	8.28	8.30	8.79	10.50	8.28	9.39	11.37	10.33	9.48	9.89	11.37	10.50]';
data.tL2(:,1) = 365 * data.tL2(:,1); % covert yr to d
units.tL2 = {'d', 'cm'};  label.tL2 = {'age', 'shell lenght'};  
temp.tL2 = C2K(23);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Cheng2016';
% 
% t-W data
data.tW =  [ ... % time since birth (d), dry weight (g)
    31.0394603	0.085292719;
    63.3222393	0.179115015;
    94.3477333	0.383817745;
    124.725362	0.784694646;
    156.339307	1.228217731;
    187.987019	1.424391226;
    218.38913	1.646152766;
    249.961127	2.396730119;
    281.6135	2.55878666;
    311.399206	2.746431084;
    344.289074	2.942604745;
    375.770159	4.358466729];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'dry weight'};  
temp.tW    = C2K(30);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ScreThan1989';

% % L-W data
% data.LW = [ ...
%  0.484560822	0.541554713	0.550039468	0.565684329	0.570351764	0.570568946	0.587990452	0.59118907	0.591939801	0.609317502	0.609472174	0.614266991	0.636466344	0.636951156	0.637274569	0.637598145	0.670395444	0.675841072	0.701243911	0.705595733	0.706133203	0.733511937	0.73379125	0.738064008	0.765028534	0.766388958	0.766972731	0.767556953	0.770362497	0.80724398	0.81235671	0.907445061	0.908943376	0.9416727	0.942389996	0.991116878	0.997773973	1.000563578	1.001579922	1.042627727	1.109098327	1.126760853	1.168370922	1.17532323	1.180368144	1.181717046	1.183067543	1.266622738	1.32171613	1.322555056	1.41165581	1.412551856	1.41308973	1.413807236	1.41542294	1.500890712	1.507333079	1.509055665	1.510205126	1.51058852	1.511355497	1.56537906	1.566571459	1.579296708	1.579697606	1.581904349	1.702625134	1.71167028	1.72163697	1.722729735	1.725574205	1.79789022	1.958750769	2.235815795	2.245697368	2.411253494	2.412784032	2.413702776	2.415541315	2.418301861	2.576641338	2.578603988	2.580568193	2.582533894	2.583845133	2.584829074	2.586141539	2.810297325	2.812438018	2.816009399	2.836003157	2.860128727	2.863033964	2.865942086	3.020924977	3.032063274	3.034372893	3.036298884	3.03899734	3.040540412	3.045850479	3.048557424	3.052428712	3.073320904	3.22772005	3.228641911	3.230178633	3.240031929	3.242088457	3.244969805	3.257657935	3.26179468	3.284536709	3.527124666	3.546424593	3.565716905	3.570244839	3.582386338	3.586025224	3.880190964	3.901794031	3.91568313	3.92762748	3.931118089	3.933613267	3.947992418	3.95099973	3.952002676	3.955012951	3.98751895	4.030636933	4.034602934	4.03524316	4.590272521	4.616561442	5.032008314	5.042075912	5.042876007	5.065002919	5.556652911	5.567063692	5.572188376	6.012471489	6.025648306	6.608448654	6.625242971	6.630289477	6.651147207	6.665511776	7.22787012	7.236130158	7.250837965	7.273647664	7.29861323	7.319715308	7.35673462	8.110880447	8.176507699	8.178843158	8.185851843	8.186111958	8.206654878	8.213948395	8.225422788	8.856222724	8.89790511	8.905812963	8.941771343	9.998255253	10.0389405	10.06317557	10.12209293	11.0004796	11.04664481	12.3737874	12.41153225	12.43005642	12.4462328	13.79938813	13.84323814	13.85729971	13.90133374	15.44744011	15.52408386	15.54774288	15.56946215	15.85107059	17.4770911	17.50150555	17.52873519	17.53930378	17.56603404	19.64709794	19.69390234	19.76400659;
%  0.022042432	0.023807608	0.022131777	0.02721239	0.024921988	0.023847296	0.023178743	0.029328705	0.025320983	0.028090693	0.027277219	0.026107175	0.032108028	0.029398576	0.027720516	0.026138255	0.03312069	0.03078198	0.032207503	0.037314056	0.034165291	0.031319475	0.029968909	0.036285251	0.042701226	0.034761863	0.031828484	0.029142621	0.045296892	0.035858245	0.040937683	0.04689262	0.038739021	0.048348562	0.044268644	0.054469909	0.05950416	0.043068583	0.038292227	0.065081074	0.050792617	0.045849937	0.05163036	0.061600349	0.088964566	0.077944626	0.068289674	0.059958976	0.077082377	0.071622411	0.089474076	0.083136371	0.079551344	0.075010583	0.065719107	0.074057335	0.106955216	0.093706795	0.085799299	0.083314602	0.078559082	0.10097031	0.092449879	0.085921882	0.083433634	0.070981948	0.080025983	0.102757836	0.124415406	0.115602773	0.095501982	0.146449435	0.095889082	0.120045949	0.170844192	0.254639944	0.236603067	0.226400212	0.207295316	0.181617775	0.278704474	0.25518585	0.233651864	0.213935034	0.201723702	0.193024924	0.182007134	0.380530604	0.348419337	0.300808373	0.314439473	0.279634467	0.248622678	0.22105026	0.496918322	0.324511043	0.297127015	0.276080816	0.249096405	0.234878211	0.455093895	0.410612806	0.354503208	0.38161872	0.551929491	0.225177841	0.505354631	0.355178673	0.33002035	0.297764007	0.449417407	0.388005221	0.411591019	0.604520482	0.321379699	0.406650387	0.35108245	0.56196794	0.499645327	0.723317329	0.901884016	0.597690482	0.420075381	0.379017009	0.352170148	0.547384632	0.501193292	0.486679037	0.445610371	0.971329592	0.663068627	1.40314919	0.580934729	1.081430789	0.558269524	0.820343479	1.543445824	0.639020631	2.164525916	1.503392295	2.870446257	1.088141991	2.176404474	0.71230101	2.886198788	2.151304323	1.969765425	3.246977506	2.52928961	2.852233064	2.498930168	1.97539791	3.256262142	2.189910924	3.717523393	4.915868648	1.92505078	4.258286033	1.737308762	3.730815909	1.567503395	2.780861951	2.509059151	2.134604399	5.480905195	3.182343461	2.871299729	4.270462475	10.3514579	6.468482984	4.892820012	2.488989761	12.20501479	7.51550313	14.8302209	10.42313541	20.7978777	7.544170587	20.56290836	14.24144477	12.66205746	8.769478951	43.66969815	24.62139525	20.64134392	17.56081226	29.3898453	64.24638708	54.65819302	19.25241967	42.57695024	35.69438717	35.29951838	63.55078654	42.11596635]';
% units.LW   = {'cm', 'g'};  label.LW = {'shell lenght', 'dry weight'};  
% bibkey.LW = 'Moha1980';
% 
%  L-W data from Hong Kong population (Three Fathoms Cove)collected during the period (2014-2015).
data.LW2 = [ ...
1.24	1.24	1.37	1.52	1.53	1.91	1.98	2.02	2.06	2.07	2.07	2.07	2.13	2.15	2.17	2.18	2.18	2.22	2.23	2.26	2.36	2.37	2.46	2.47	2.47	2.49	2.54	2.55	2.55	2.57	2.68	2.71	2.73	2.76	2.82	2.83	2.84	2.86	2.88	2.88	2.89	2.91	2.95	2.95	2.95	2.98	2.99	3	3	3.02	3.08	3.09	3.11	3.14	3.14	3.16	3.19	3.19	3.24	3.28	3.31	3.31	3.33	3.34	3.35	3.36	3.37	3.37	3.38	3.39	3.39	3.42	3.42	3.45	3.45	3.46	3.54	3.57	3.57	3.58	3.58	3.6	3.61	3.64	3.65	3.65	3.72	3.72	3.72	3.73	3.74	3.74	3.74	3.75	3.76	3.78	3.79	3.79	3.79	3.81	3.82	3.82	3.83	3.85	3.87	3.88	3.89	3.92	3.93	3.94	3.96	3.99	4	4.04	4.04	4.16	4.19	4.31	4.32	4.33	4.34	4.4	4.44	4.45	4.46	4.52	4.54	4.56	4.56	4.57	4.6	4.64	4.64	4.66	4.67	4.67	4.68	4.69	4.69	4.72	4.75	4.76	4.79	4.81	4.81	4.81	4.83	4.83	4.84	4.86	4.86	4.87	4.88	4.89	4.89	4.89	4.91	4.92	4.96	4.96	4.96	4.97	4.98	4.98	4.98	4.98	5	5.01	5.02	5.02	5.04	5.05	5.05	5.06	5.06	5.06	5.07	5.07	5.08	5.09	5.09	5.11	5.12	5.12	5.13	5.13	5.14	5.15	5.16	5.17	5.18	5.18	5.19	5.19	5.19	5.2	5.21	5.22	5.22	5.23	5.24	5.24	5.25	5.26	5.26	5.28	5.28	5.28	5.29	5.29	5.3	5.31	5.31	5.32	5.33	5.33	5.34	5.34	5.37	5.37	5.38	5.38	5.38	5.38	5.39	5.41	5.42	5.44	5.44	5.45	5.46	5.48	5.49	5.5	5.51	5.52	5.53	5.53	5.54	5.54	5.55	5.55	5.56	5.58	5.58	5.59	5.59	5.6	5.6	5.61	5.64	5.64	5.67	5.67	5.69	5.71	5.72	5.73	5.73	5.75	5.75	5.76	5.8	5.81	5.83	5.83	5.83	5.84	5.86	5.88	5.88	5.9	5.9	5.91	5.94	5.95	5.95	5.95	5.96	5.97	5.98	6.01	6.01	6.01	6.04	6.05	6.06	6.06	6.07	6.07	6.08	6.08	6.11	6.14	6.15	6.16	6.16	6.2	6.23	6.23	6.24	6.25	6.25	6.27	6.27	6.28	6.3	6.33	6.34	6.34	6.36	6.36	6.37	6.38	6.39	6.39	6.42	6.43	6.44	6.45	6.45	6.45	6.45	6.45	6.46	6.48	6.48	6.49	6.49	6.5	6.5	6.52	6.56	6.57	6.57	6.67	6.67	6.68	6.68	6.68	6.81	6.83	6.83	6.83	6.83	6.84	6.87	6.88	6.89	6.91	6.91	6.94	6.97	6.98	7	7.01	7.06	7.06	7.09	7.14	7.15	7.17	7.18	7.18	7.19	7.22	7.22	7.22	7.23	7.31	7.31	7.32	7.35	7.36	7.39	7.39	7.4	7.41	7.43	7.46	7.48	7.5	7.5	7.51	7.53	7.54	7.54	7.55	7.56	7.56	7.58	7.59	7.64	7.66	7.69	7.71	7.71	7.78	7.79	7.79	7.84	7.84	7.85	7.87	7.91	7.91	7.91	7.93	7.93	7.94	7.94	7.94	7.94	7.96	7.96	8.02	8.04	8.1	8.17	8.18	8.19	8.21	8.21	8.22	8.28	8.28	8.3	8.32	8.34	8.38	8.38	8.43	8.46	8.51	8.55	8.56	8.58	8.59	8.62	8.64	8.64	8.69	8.76	8.78	8.79	8.79	8.79	8.8	8.87	8.91	8.95	8.99	9	9.02	9.23	9.28	9.48	9.7	9.83	9.89	10.3	10.33	10.5	11.01	11.37;
0.06	0.08	0.09	0.12	0.08	0.25	0.19	0.35	0.21	0.45	0.41	0.18	0.22	0.18	0.34	0.11	0.21	0.32	0.54	0.24	0.18	0.29	0.74	0.49	0.31	0.44	0.34	0.57	0.53	0.39	0.04	0.53	0.75	0.49	0.6	0.48	0.62	0.86	0.75	0.68	0.34	0.63	0.86	0.67	0.59	0.71	0.65	0.62	0.54	0.72	0.87	0.69	0.67	0.32	0.72	1.03	1.05	0.88	1.06	1.06	0.91	0.82	0.61	1.09	0.93	1.07	1	1.15	1.15	1.03	0.78	0.81	1.03	1.01	1.28	1.35	1.4	1.08	1.22	1.44	0.98	1.22	1.37	1.38	1.23	1.5	1.25	1.27	1.35	1.38	1.53	1.42	1.55	1.12	1.13	1.55	1.28	1.27	0.99	1.46	1.34	1.15	1.05	1.02	1.03	1.41	1.51	1.37	1.72	2.2	1.64	1.19	2.01	1.8	2.33	2.21	2.31	2.63	2	2.02	2.47	2.31	2.79	2.28	2.1	2.7	2.35	2.71	2.89	2.39	2.92	1.75	2.58	3.94	2.35	2.6	2.34	3.08	2.95	2.68	2.69	2.66	2.22	3.64	2.73	2.74	2.65	2.42	2.63	3.24	3.07	2.93	2.79	3.21	4	2.3	2.84	2.67	2.43	2.65	2.25	3.02	3.14	2.64	2.46	3.64	2.92	3.33	3.94	2.41	2.2	3.01	2.57	3.14	2.89	3.23	2.53	1.99	3.23	2.99	2.95	4.99	3.7	3.5	3.39	3.67	3.2	3.57	4.55	4.03	2.54	3.15	2.9	3.16	3.84	2.97	3.66	3.55	3.5	3.35	1.79	3.11	3.82	3.92	3.23	3.85	3.11	2.52	3.08	3.44	3.39	2.96	3.12	2.71	2.47	3.73	3.59	4.03	3.3	4.56	3.79	3.92	4.23	3.51	2.82	3.4	4.46	4.39	3.36	4.27	3.8	2.86	4.11	3.39	4.23	3.46	3.55	3.85	5.25	4.46	5.13	4.62	4.02	3.73	3.62	3.61	3.44	3.26	4.21	4.3	4.13	3.66	4.86	4.25	5.12	4.63	3.72	4.15	3.3	5.39	4.85	4.2	3.12	4.07	4.76	5.98	4.11	2.88	4.66	3.44	3.18	3.74	4.34	6.21	3.65	5.38	3.08	5.26	3.51	3.05	4.41	4.77	5.49	5.8	6.23	4.89	4.73	3.49	4.87	4.28	5.96	3.89	3.19	3.73	4.88	4.91	5.48	4.35	4.37	4.42	3.85	3.04	4.3	4.71	4.32	5.59	5.72	6.22	5.16	4.26	6.99	4.17	4.63	3.99	5.69	6.13	3.82	4.3	4.08	6.13	8.85	6.41	3.91	4.69	4.93	6.07	6.46	4.47	6.8	4.63	5.4	4.72	5.78	5.88	3.89	3.43	7.76	5.17	5.47	4.14	6.74	6.95	7.69	6.55	4.28	5.57	7.17	5.93	6.5	7.05	5.07	7.09	6.1	5.27	5.46	5.34	6.4	5.33	6.62	6.34	5.76	5.05	6.57	5.64	5.8	8.89	6.64	6.26	4.3	6.52	5.62	6.23	6.34	5.5	8.89	6.1	8.08	7.54	9.28	9.52	8.25	10.47	7.2	5.75	5.07	10.06	6.43	6.85	6.38	8.35	11.92	9.78	6.91	7.94	7.91	8.56	9.43	8.32	8.49	7.77	8.21	8.88	9.79	8.1	9.36	10.64	7.73	11.51	8.85	7.88	9.36	8.27	8.12	9.99	11	7.69	8.03	9.49	6.96	14.81	8.39	7.88	9.73	9.93	13.03	10.5	9.5	14.82	12.23	11.33	11.73	11.85	10.61	11.45	13.4	8.91	10.97	8.17	6.95	9.87	10.45	13.78	9.81	12.25	13.7	10.19	14.7	15.08	13.38	13.68	10.33	15.06	7.76	15.92	10.98	12.21	10.08	15.31	18.25	12.21	25.32	15.05	14.01	19.55	17.54]';
units.LW2   = {'cm', 'g'};  label.LW2 = {'shell lenght', 'wet weight'};  
bibkey.LW2 = 'Cheng2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tj = weights.tj*0;
% weights.Li = weights.Li*5;
% weights.ab = 5 * weights.ab;
% weights.Wdi = 5 * weights.Wdi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Time in tL and tW data is shifted by t_0 since first (t,L) point (47,2.4) is inconsistent with (ap,Lp) = (90,2)';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'This entry is discussed in McFa2015a';
metaData.bibkey.F1 = 'McFa2015a'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4F6V8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466850'; % Ency of Life
metaData.links.id_Wiki = 'Perna_viridis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39229'; % Taxonomicon
metaData.links.id_WoRMS = '367822'; % WoRMS
metaData.links.id_molluscabase = '367822'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perna_viridis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LaxmRao2011'; type = 'Article'; bib = [ ...  
'author = {Laxmilatha, P. and Rao, G. S. and Patnaik, P. T. N. and Rao, M.P. and Dash, B.}, ' ...
'year = {2011}, ' ...
'title = {Potential for the hatchery production of spat of the green mussel \emph{Perna viridis} {L}innaeus (1758)}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {312}, ' ...
'pages = {88--94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Moha1980'; type = 'Article'; bib = [ ...  
'author = {Mohan, M.}, ' ...
'year = {1980}, ' ...
'title = {Allometric relationships in the green mussel, \emph{Perna viridis} {L}}, ' ...
'journal = {Indian Journal of Marine Science}, ' ...
'volume = {9}, ' ...
'pages = {224-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RajaVenu2006'; type = 'Article'; bib = [ ...  
'author = {Rajagopal, S. and Venugopalan, V. P. and Velde,  G. van der and Jenner, H. A.}, ' ...
'year = {2006}, ' ...
'title = {Greening of the coasts: a review of the \emph{Perna viridis} success story}, ' ...
'journal = {Aquatic Ecology}, ' ...
'volume = {40}, ' ...
'pages = {273-297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Appukuttan1977'; type = 'Article'; bib = [ ...  
'author = {Appukuttan, K.K.}, ' ...
'year = {1977}, ' ...
'title = {On the occurence of the green mussels \emph{Perna viridis} ({L}innaeus) in {A}ndman {I}sland}, ' ...
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {24}, ' ...
'pages = {244-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ScreThan1989'; type = 'Article'; bib = [ ...  
'author = {Sreenivasan, P. V. and Thangavelu, R. and Poovannan, P.}, ' ...
'year = {1989}, ' ...
'title =  {Biology of the green mussel, \emph{Perna viridis} ({L}innaeus) cultured in {M}uttukadu {L}agoon, {M}adras}, ' ...
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {36}, ' ...
'pages = {149-155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tan1975'; type = 'Article'; bib = [ ...  
'author = {Tan, W.}, ' ...
'year = {1975}, ' ...
'title =  {Egg and larval development in the Green Mussel, \emph{Mytilus viridis} {L}innaeus}, ' ...
'journal = {The Veliger}, ' ...
'volume = {18}, ' ...
'pages = {151-155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McFa2015'; type = 'Misc'; bib = [ ...
'author = {Katie McFarland}, ' ...
'year = {2015}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cheng2016'; type = 'Misc'; bib = [ ...
'author = {Martin Cheng}, ' ...
'year = {2016}, ' ...
'note = {Experimental work: age estimation (shell rings), and lenght-weight measurement}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McFa2015a'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.http://deb2015.mio.univ-amu.fr/wp-content/uploads/2015/05/McFarland_DEB_Symposium.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
