function [data, auxData, metaData, txtData, weights] = mydata_Pagophilus_groenlandicus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Pagophilus_groenlandicus'; 
metaData.species_en = 'Harp seal'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, Seal body temperature should be between 36.5-37.5 C
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine','Ana Sofia Aniceto'};    
metaData.date_subm = [2016 12 06];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 12];

%% set data
% zero-variate data

data.tg = 120+228;    units.tg = 'd';    label.tg = 'gestation time'; bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '120 days of delayed implantation and 228 days of gestation';
data.tx = 12;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'npolar';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 6*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'npolar';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6 - 8 years npolar, ';
data.am = 30*364;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'In the wild they are believed to live over 30 yrs';

data.Lb  = 85;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'npolar';  
data.Lp  = 137;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'MillBurt2001'; 

data.Wwb = 10e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KovaLavi1985';
data.Wwx = 35e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'KovaLavi1985';
data.Wwi = 180e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data

% adults
data.tL = [ ...
0.127	0.151	0.131	0.088	0.089	0.068	0.069	0.550	0.506	0.573	0.553	1.141	1.120	1.142	1.165	1.166	1.167	1.167	1.212	1.102	1.189	1.564	1.584	1.538	1.493	2.089	2.088	2.110	2.086	2.506	2.483	2.439	2.503	2.504	3.013	3.075	3.076	3.031	2.964	3.494	3.557	4.546	4.610	4.984	5.004	5.577	5.555	5.576	5.576	5.553	6.059	6.015	5.993	5.970	6.013	6.255	6.298	6.999	7.042	8.010	9.017	9.563	9.058	9.057	8.487	9.012	9.034	10.026	10.025	10.024	10.068	10.111	10.043	9.998	10.986	11.051	11.113	11.533	12.039	12.039	12.016	12.014	12.013	12.056	13.023	13.022	13.087	13.065	14.009	14.031	14.029	14.533	15.062	15.016	15.038	15.015	15.058	16.023	16.022	16.021	16.040	17.188	16.987	17.031	18.017	18.059	18.015	18.014	18.012	17.508	19.025	19.088	19.109	20.034	20.032	20.007	20.577	21.038	21.080	21.565	21.564	21.561	21.034	22.112	22.041	22.545	24.557	23.098	23.556	24.016	24.539	25.045	25.137	26.052	28.020	28.986;
78.547	91.046	96.850	102.878	108.235	110.021	112.476	112.912	111.574	118.938	124.966	112.006	114.685	116.247	120.488	122.943	127.184	128.970	137.005	133.436	131.201	140.122	132.755	122.935	117.802	140.333	133.414	133.413	125.155	143.002	140.548	137.870	130.949	128.940	159.732	143.659	142.097	140.089	136.742	154.364	142.979	158.582	152.777	160.358	152.545	167.711	165.925	164.139	161.684	160.568	171.048	167.924	165.916	162.791	160.558	163.008	159.436	163.215	159.642	178.817	178.795	171.193	166.740	160.044	156.262	156.920	154.687	184.352	180.335	177.879	175.423	172.297	164.263	156.005	170.715	165.356	148.837	168.694	178.504	176.495	171.585	165.558	158.862	155.736	172.232	168.437	165.981	163.972	173.549	172.656	164.174	166.618	182.901	173.973	171.517	168.839	163.035	173.058	169.263	163.460	150.513	192.451	175.268	173.482	179.710	171.450	169.888	161.853	153.594	153.159	181.027	169.418	162.498	189.933	179.888	165.380	168.269	174.732	165.356	181.193	176.952	163.113	157.098	178.502	154.397	157.734	142.064	182.275	173.113	172.433	159.921	173.973	190.712	169.039	156.495	170.313    
    ]';  % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) * 365; % yr to day
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'InneStew1981';
  
% t-W data

% weaning
data.tWx = [ ... days ; kg
0	0.01	0.02	0.03	0.04	0.05	0.06	0.07	0.08	0.099	0.117	0.061	0.079	0.062	0.078	0.982	0.983	1.224	1.225	1.261	1.262	1.26	1.279	1.241	1.259	1.427	1.24	0.585	2.216	2.797	3.077	3.924	4.186	4.187	3.904	4.185	3.905	3.922	3.959	3.94	3.941	3.902	3.939	3.976	6.917	6.001	6.02	5.721	5.722	6.003	5.984	6.002	6.868	6.923	6.924	6.942	6.904	6.885	6.753	7.184	7.053	7.183	7.239	7.201	6.883	7.219	6.901	7.162	6.9	7.255	8.066	8.065	8.027	8.156	9.678	11.078	11.117	9.861	9.881	9.863	9.883	11.005	11.343	11.306	11.362	11.363	11.345	11.252	10.934	11.346	11.047	11.066	11.067	11.03;
8.604	9.508	10.333	11.08	12.023	15.126	13.437	12.651	11.786	11.04	10.136	9.311	8.604	7.897	7.189	17.482	16.539	15.006	14.142	13.434	12.452	11.784	10.92	10.173	9.427	8.719	7.776	8.563	12.647	14.217	12.724	22.034	21.209	20.423	19.559	18.851	18.105	17.28	16.612	15.787	14.962	14.137	13.39	12.643	14.327	17.433	19.005	20.616	21.324	22.462	21.441	20.459	30.123	28.394	28.394	27.529	26.822	26.154	24.583	25.446	24.622	23.718	22.853	21.989	21.321	20.574	19.75	18.963	18.217	17.391	28.509	26.977	25.248	21.279	31.571	23.631	26.028	23.712	25.991	27.052	29.213	26.971	28.424	29.21	30.114	32.393	33.179	34.004	33.926	34.908	35.576	37.855	38.759	40.331    
    ]';  
[t in] = sort(data.tWx(:,1)); data.tWx = data.tWx(in,:); % sort times
data.tWx(:,2) = data.tWx(:,2) * 1e3; % kg to g
units.tWx   = {'d', 'g'};  label.tWx = {'time since birth', 'wet weight'};  
temp.tWx    = C2K(37);  units.temp.tWx = 'K'; label.temp.tWx = 'temperature';
bibkey.tWx = 'KovaLavi1985';
comment.tWx = 'Weight post weaning was not included here, but is in the original publication.';

% adults
data.tW = [ ... year ; kg
0.3	0.3	0.3	0.3	0.3	0.3	0.3	0.3	0.3	0.07	0.446	0.448	0.467	0.467	0.49	0.954	1.02	1.042	1.063	1.065	1.088	1.089	1.505	1.55	1.551	1.572	2.017	2.036	2.059	2.06	2.104	2.502	2.504	2.522	2.524	2.567	3.054	3.055	3.077	3.098	3.539	3.539	4.028	4.051	4.599	4.622	4.623	4.867	4.955	4.957	5.42	5.464	5.465	5.485	5.506	5.886	5.931	5.932	5.948	5.95	5.975	5.999	6.965	6.966	6.991	7.937	8.489	8.953	8.979	8.996	9.017	9.084	9.507	9.922	9.944	9.969	9.97	9.971	9.974	9.99	9.994	10.919	10.96	11.517	11.931	11.958	11.976	11.977	12	12.947	12.952	12.973	12.995	12.995	12.996	13.968	13.99	14.05	14.45	14.943	14.98	14.983	14.985	15.003	15.957	15.972	15.977	15.993	15.994	15.994	16.925	16.967	16.967	16.968	16.973	16.988	17.539	17.963	17.979	17.985	17.986	18.031	18.051	19	19.001	20.013	20.032	20.036	20.037	20.632	21.028	21.032	21.033	21.053	21.56	21.561	21.562	21.582	21.605	21.648	22.507	22.553	22.995	23.043	23.985	24.514	25.029	25.575	25.578	26.063	28.091	29.087;
31.49	54.576	35.929	38.593	44.808	27.05	21.943	24.829	34.152	31.708	44.794	55.449	32.141	29.699	39.243	46.333	39.449	37.007	32.567	47.661	58.093	63.643	32.554	42.097	47.647	39.211	71.828	45.635	53.403	65.168	62.059	68.262	86.686	49.172	62.934	55.608	67.58	82.23	79.122	65.803	62.904	59.131	93.744	100.181	67.978	71.085	83.294	94.164	89.499	110.143	104.358	107.686	116.343	90.15	83.046	124.766	132.978	141.635	84.365	105.452	131.201	149.846	104.534	114.967	135.388	109.833	107.375	114.686	149.758	102.698	91.821	98.922	130.43	94.236	96.455	120.206	129.529	133.08	161.715	106.221	149.506	129.944	94.649	145.243	94.62	138.571	99.725	113.265	120.146	99.03	148.086	132.991	137.43	134.545	141.426	149.166	151.385	93.892	119.407	182.878	119.835	147.804	162.677	129.824	166.421	107.375	151.548	99.162	109.151	105.377	143.307	124.216	119.999	127.99	177.046	114.892	102.668	149.27	91.778	141.5	151.489	163.474	139.722	143.468	144.8	117.911	88.831	128.565	135.89	129.879	114.329	148.513	158.058	138.302	135.401	146.5	150.273	129.407	139.617	128.739	114.729	131.598	130.253	169.541	103.809	94.248	159.272	105.537	133.062	134.38	105.241	129.851    
    ]';  
data.tW(:,1) = data.tW(:,1) * 365; % yr to day
data.tW(:,2) = data.tW(:,2) * 1e3; % kg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'InneStew1981';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb; 
weights.Ri= 5 * weights.Ri; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Milk was supposed to be 15 times more nutritinous than solid food to capture fast neonate growth till weaning';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = '120 days of delayed implantation and 228 days of gestation';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'No sexual dimorphism';
metaData.bibkey.F2 = 'KovaLavi'; 
F3 = 'The fat content of phocid seal milk is generally high relative to many other mammalian groups';
metaData.bibkey.F3 = 'KovaLavi'; 
F4 = 'the growth rate during weaning appears to be second only to that of the hooded seal Crystophora cristata';
metaData.bibkey.F4 = 'KovaLavi1985'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '75KB3'; % Cat of Life
metaData.links.id_ITIS = '622022'; % ITIS
metaData.links.id_EoL = '46559168'; % Ency of Life
metaData.links.id_Wiki = 'Pagophilus_groenlandicus'; % Wikipedia
metaData.links.id_ADW = 'Pagophilus_groenlandicus'; % ADW
metaData.links.id_Taxo = '67439'; % Taxonomicon
metaData.links.id_WoRMS = '159019'; % WoRMS
metaData.links.id_MSW3 = '14001057'; % MSW3
metaData.links.id_AnAge = 'Pagophilus_groenlandicus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Harp_seal}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pagophilus_groenlandicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AWD'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Pagophilus_groenlandicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'npolar'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.npolar.no/en/species/harp-seal.html}}';
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
bibkey = 'MillBurt2001'; type = 'Article'; bib = [ ... 
'author = {Miller, E. H. and Burton, L. E.}, ' ... 
'year = {2001}, ' ...
'title = {It''s all relative: allometry and variation in the baculum of the harp seal, \textit{Pagophilus groenlandicus}}, ' ...
'journal = {Journal of Mammology}, ' ...
'volume = {72}, ' ...
'pages = {345-355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KovaLavi1985'; type = 'Article'; bib = [ ... 
'author = {Kovacs, K. M. and Lavigne, D.M.}, ' ... 
'year = {1985}, ' ...
'title = {Neonatal growth of and organ allometry of {N}orthwest {A}tlantic harp seals, \textit{Pagophilus groenlandicus}}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {63}, ' ...
'pages = {2793--2799}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KovaLavi1986'; type = 'Article'; bib = [ ... 
'author = {Kovacs, K. M. and Lavigne, D. M.}, ' ... 
'year = {1986}, ' ...
'title = {Maternal investment and neonatal growth in phocid seals}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {55}, ' ...
'pages = {1035--1051}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'InneStew1981'; type = 'Article'; bib = [ ... 
'author = {Innes, S. and Stewart, R. E. A. and Lavigne, D. M.}, ' ... 
'year = {1981}, ' ...
'title = {Growth in {N}orthwest {A}tlantic Harp seals \textit{Phoca groenlandica}}, ' ...
'journal = {Journal of zoology}, ' ...
'volume = {194}, ' ...
'pages = {11--24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

