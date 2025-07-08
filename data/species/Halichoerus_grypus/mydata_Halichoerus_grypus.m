function [data, auxData, metaData, txtData, weights] = mydata_Halichoerus_grypus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Halichoerus_grypus'; 
metaData.species_en = 'Grey seal'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp usually 37 or so for a mammal
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2016 12 12];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 12 12];  

%% set data
% zero-variate data

data.tg = 100 + 240;    units.tg = 'd';    label.tg = 'gestation time';  bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 19;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1460;    units.tp = 'd';    label.tp = 'time since birth at puberty (fem.)'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1887;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 46 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 230;   units.Li  = 'cm';  label.Li  = 'ultimate length fem';   bibkey.Li  = 'Hauk2007';
data.Lim  = 255;   units.Lim  = 'cm';  label.Lim  = 'ultimate length male';   bibkey.Lim  = 'Hauk2007';
data.Wwb = 14e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 41.450e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 240e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Hauk2007';
data.Wwim = 310e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Hauk2007';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% t-L
% females
data.tL = [ ...
0.049	0.000	0.148	0.049	0.049	0.098	0.049	0.098	0.836	1.870	1.870	2.903	2.952	2.854	5.904	5.953	5.953	5.953	5.953	3.887	3.936	4.084	4.034	3.985	3.887	4.969	4.969	4.969	6.888	6.888	6.790	7.036	7.872	7.872	7.872	7.921	8.905	9.004	9.004	8.856	10.037	9.889	9.988	9.988	9.988	9.889	11.021	10.873	10.923	12.103	12.103	12.103	12.005	13.038	12.989	12.989	12.989	12.989	13.924	13.924	13.875	13.973	14.957	15.006	14.957	14.859	15.892	15.990	15.941	15.941	15.990	16.974	16.974	18.007	18.057	18.057	18.991	19.090	19.975	19.975	19.975	20.172	21.009	21.009	22.042	23.075	23.124	24.108	25.092	27.011	27.011	27.011	27.946	28.979	28.044	28.979	30.012	31.980	32.128	36.015;
79.891	88.820	95.031	136.180	128.416	118.711	107.065	159.472	145.497	160.248	169.565	183.540	175.388	169.177	207.997	199.068	187.034	183.152	170.730	195.963	190.140	185.093	175.776	170.730	161.025	176.165	183.929	192.857	213.432	201.398	176.165	181.211	208.385	197.516	188.587	183.152	203.727	192.081	183.929	166.071	211.102	202.562	196.351	192.469	180.047	174.612	168.012	199.068	190.916	197.127	184.705	182.376	202.562	212.267	202.950	196.739	190.140	182.764	213.432	223.525	197.904	183.540	212.655	205.668	197.127	185.870	227.019	220.031	205.668	201.786	194.022	220.419	202.950	190.528	181.988	177.717	203.339	178.882	232.065	218.090	211.491	197.127	216.149	197.516	197.904	229.736	201.398	183.152	185.481	214.208	202.950	197.904	179.270	196.739	214.596	210.326	209.938	212.655	174.612	203.727    
    ]';  % yr and cm, age and standard length at f and T
data.tL(:,1) = data.tL(:,1) * 365; % yr to day
[Y,I]=sort(data.tL(:,1)); data.tL = data.tL(I,:); % sort rows
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', 'female'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hauk2007'; comment.tL = 'female, fig 2';

% male
data.tLm = [ ...
0.148	0.098	0.197	0.148	0.098	0.148	1.870	1.870	2.804	2.804	3.936	3.936	3.985	3.887	5.018	4.871	4.920	6.002	5.953	5.756	7.872	7.872	7.872	7.872	9.004	8.954	9.988	9.938	10.923	10.972	11.070	10.873	11.857	12.005	12.005	12.005	12.054	12.940	12.989	13.924	13.924	13.973	13.825	14.908	14.908	15.990	15.990	17.860	18.057	17.909	18.893	18.942	19.926	21.009	20.959	21.894	21.894	23.124;
100.466	108.618	115.606	121.817	130.357	145.109	180.823	167.236	180.047	170.730	175.776	160.637	186.646	204.503	226.630	196.351	185.870	242.935	217.702	199.457	236.724	230.901	220.031	201.786	224.689	212.267	214.596	239.829	205.668	215.373	232.065	251.087	252.640	240.217	232.065	216.537	202.562	255.357	239.441	254.193	237.112	222.360	206.444	246.040	236.724	240.994	235.171	254.193	230.901	224.689	237.112	232.842	215.373	228.183	248.370	242.935	231.289	205.668    
    ]';  % yr and cm, age and standard length at f and T
data.tLm(:,1) = data.tLm(:,1) * 365; % yr to day
[Y,I]=sort(data.tLm(:,1)); data.tLm = data.tLm(I,:); % sort rows
units.tLm   = {'d', 'cm'};  label.tLm = {'time since birth', 'standard length', 'male'};  
temp.tLm    = C2K(37);  units.temp.tLm = 'K'; label.temp.tLm = 'temperature';
bibkey.tLm = 'Hauk2007'; comment.tL = 'male, fig 2';

% t-W
% females
data.tW = [ ...
0.348	0.348	0.155	0.232	0.271	0.271	0.271	0.271	1.044	2.011	1.972	3.055	3.983	4.061	3.983	3.945	4.022	4.138	4.099	5.066	5.144	5.144	5.028	5.105	6.072	6.072	6.072	6.033	5.994	6.033	6.072	6.961	7.039	6.884	6.961	8.006	8.044	7.967	9.011	9.011	9.978	10.133	10.133	10.094	10.094	10.017	10.094	11.022	11.022	11.022	10.983	12.028	11.989	11.989	13.033	13.072	12.994	13.072	13.033	13.961	13.961	14.077	15.006	15.006	15.006	15.044	15.972	15.934	16.978	19.994	20.149	18.989	18.099	17.945	19.994	22.083	20.961	23.088	24.094	24.983	28.116	28.967	29.972	32.099;
77.997	12.835	67.630	52.327	43.441	34.556	28.138	22.214	75.529	96.262	111.566	110.578	78.984	93.794	100.705	116.996	144.640	157.475	180.183	207.828	155.994	148.590	127.856	118.477	210.296	181.171	174.260	166.361	141.185	127.362	94.781	207.828	179.196	152.539	127.362	232.511	151.551	116.996	165.374	159.944	180.183	166.855	157.475	130.324	124.894	115.021	104.654	213.752	163.893	131.312	113.540	163.893	154.020	145.628	219.676	174.260	166.855	158.956	140.691	204.372	196.968	131.805	194.993	161.425	152.539	119.958	205.853	154.513	158.463	241.396	230.536	194.006	152.539	145.134	169.323	181.171	142.666	133.286	139.210	110.085	180.677	200.917	134.274	141.678    
    ]';  % yr and kg, age and wet weight at f and T
data.tW(:,1) = data.tW(:,1) * 365; % yr to day
data.tW(:,2) = data.tW(:,2) * 1e3; % kg to g
[Y,I]=sort(data.tW(:,1)); data.tW=data.tW(I,:); % sort rows
units.tW  = {'d', 'cm'};  label.tW = {'time since birth', 'wet weight', 'female'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Hauk2007'; comment.tW = 'female, fig 3';

% male
data.tWm = [ ...
0.232	0.271	0.271	0.271	0.193	1.934	2.939	4.061	3.983	6.072	8.083	9.088	10.983	10.906	8.972	9.939	10.983	11.022	12.066	11.873	11.950	10.906	5.878	14.000	14.039	14.039	12.994	13.961	13.961	13.961	15.044	15.044	15.122	16.011	16.011	18.022	18.061	17.983	18.950	22.006	21.967;
65.162	56.276	48.378	32.581	24.189	71.086	109.591	124.401	159.944	151.058	219.182	196.474	203.879	166.361	169.817	265.585	261.142	252.257	250.776	240.409	212.271	310.014	135.261	189.069	216.220	241.396	300.141	289.774	278.420	264.104	270.522	263.611	239.915	280.889	230.042	267.066	259.661	226.093	250.776	237.447	213.752    
    ]';  % yr and kg, age and wet weight at f and T
data.tWm(:,1) = data.tWm(:,1) * 365; % yr to day
data.tWm(:,2) = data.tWm(:,2) * 1e3; % kg to g
[Y,I]=sort(data.tWm(:,1)); data.tWm = data.tWm(I,:); % sort rows
units.tWm  = {'d', 'cm'};  label.tWm = {'time since birth', 'wet weight', 'male'};  
temp.tWm    = C2K(37);  units.temp.tWm = 'K'; label.temp.tWm = 'temperature';
bibkey.tWm = 'Hauk2007'; comment.tWm = 'female, fig 3';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL'; 'tLm'}; subtitle1 = {'standard length females, males'};
set2 = {'tW'; 'tWm'}; subtitle2 = {'wet weight females, males'};
metaData.grp.sets = {set1; set2};
metaData.grp.subtitle = {subtitle1; subtitle2};

%% Discussion points
D1 = 'Males are assumes to differ from females by {p_Am} only.';
D2 = 'The parameter t_0 is fixed at 100 d (treated as an observation)';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'The total gestation time includes 100 days of delayed implantation.';
metaData.bibkey.F1 = 'AnAge'; 
F2 = 'Sexual dimorphism';
metaData.bibkey.F2 = 'Hauk2007'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3JBV8'; % Cat of Life
metaData.links.id_ITIS = '180653'; % ITIS
metaData.links.id_EoL = '46559156'; % Ency of Life
metaData.links.id_Wiki = 'Halichoerus_grypus'; % Wikipedia
metaData.links.id_ADW = 'Halichoerus_grypus'; % ADW
metaData.links.id_Taxo = '67432'; % Taxonomicon
metaData.links.id_WoRMS = '137080'; % WoRMS
metaData.links.id_MSW3 = '14001036'; % MSW3
metaData.links.id_AnAge = 'Halichoerus_grypus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Grey_seal}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Halichoerus_grypus}}';
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
bibkey = 'Hauk2007'; type = 'Article'; bib = [ ... 
'author = {E. Hauksson}, ' ... 
'year = {2007}, ' ...
'title = {Growth and reproduction in the {I}celandic grey seal}, ' ...
'journal = {NAMMCO Scientific Publications}, ' ...
'doi = {10.7557/3.2730}, ' ...
'issn = {2309-2491}, ' ...
'url = {https://www.ub.uit.no/baser/septentrio/index.php/NAMMCOSP/article/view/2730}, ' ...
'pages = {153--162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

