function [data, auxData, metaData, txtData, weights] = mydata_Phoca_vitulina 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Phoca_vitulina'; 
metaData.species_en = 'Harbor seal'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN', 'MAN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, Seal body temperature should be between 36.5-37.5 C
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine','Ana Sofia Aniceto'};    
metaData.date_subm = [2016 12 06];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 12 06];

%% set data
% zero-variate data

data.tg = 329;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)';           bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1460;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';           bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 17374;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 100;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'KovaLyde';  
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'KovaLyde';
  comment.Li = 'Svalbard';
data.Lim  = 150;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'KovaLyde';
  comment.Lim = 'Svalbard';
  
data.Wwb = 12e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KovaLyde';
data.Wwx = 22e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'KovaLavi1986';
  comment.Wwx = 'combined male and female from all subspecies in appendix';
data.Wwi = 83e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'KovaLyde';
  comment.Wwi = 'Svalbard';
data.Wwim = 104e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'KovaLyde';
  comment.Wwim = 'Svalbard';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KovaLyde';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% t-L data females
data.tL = [ ...
0.011	0.017	0.038	0.039	0.077	0.093	0.921	0.967	0.970	0.978	1.007	1.018	1.021	1.027	1.028	10.041	10.894	10.949	10.994	11.852	11.901	11.905	11.990	15.939	19.999	2.016	2.054	2.060	2.069	2.091	2.095	2.110	2.112	21.036	3.007	3.035	3.052	3.059	3.064	3.075	3.913	3.937	3.940	3.980	3.996	4.023	4.055	4.994	5.075	5.937	5.943	5.984	6.019	7.031	7.055	7.078	7.155	8.006	8.043	8.988	9.046	9.991;
83.002	86.314	79.688	97.173	99.564	73.245	117.023	122.911	107.635	111.684	109.106	114.811	99.167	119.044	102.664	155.577	160.152	153.709	142.297	149.816	140.244	159.569	151.469	151.716	139.812	124.351	109.626	112.387	116.988	128.214	130.238	103.735	121.588	152.479	130.578	128.001	119.534	122.847	125.423	113.644	145.091	140.489	141.777	127.972	119.137	132.756	131.835	128.493	135.484	144.844	147.973	134.720	152.388	152.173	130.270	141.497	146.463	150.118	151.958	151.929	147.326	164.413    
    ]';  % yr, age & cm,length at f and T
data.tL(:,1) = data.tL(:,1) * 365; % yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length', 'female'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MarkBjor1989';
subtitle.tL = 'Data for females';

% t-L data males
data.tLm = [ ...
  0	0	0	0	0.015	0.020	0.044	0.046	0.061	0.801	0.830	0.832	0.836	0.870	0.929	1.852	1.877	1.879	1.884	1.911	10.824	10.847	11.916	11.924	13.866	13.903	14.860	14.869	14.940	16.877	2.760	2.792	2.821	2.823	2.858	2.887	20.807	20.876	22.915	3.834	3.899	5.884	5.913	5.944	6.824	6.825	6.884	7.897	7.902	8.838	9.870;
99.696	103.702	105.705	107.526	85.857	95.326	78.209	82.761	109.711	114.076	106.246	108.249	116.626	117.900	103.150	135.011	118.986	122.628	132.826	120.989	174.107	155.533	148.971	164.267	159.339	166.258	139.666	155.691	162.428	149.305	139.740	137.919	129.906	132.274	134.823	127.175	164.395	167.672	156.916	142.647	139.733	152.467	144.819	139.721	154.465	155.739	141.718	155.733	164.656	159.187	146.616      
    ]';  % yr, age & cm,length at f and T
data.tLm(:,1) = data.tLm(:,1) * 365; % yr to d
units.tLm   = {'d', 'cm'};  label.tLm = {'time since birth', 'length', 'male'};  
temp.tLm    = C2K(37);  units.temp.tLm = 'K'; label.temp.tLm = 'temperature';
bibkey.tLm = 'MarkBjor1989';
comment.tLm = 'Data for males';

% t-Ww data females
data.tW = [ ...
0.913	1.981	2.942	3.771	4.861	5.898	8.877	8.875	7.817	9.906	10.896	11.855	13.906	15.824	16.943	19.818	20.888;
34.643	44.800	50.350	61.465	55.724	71.447	74.580	71.559	76.186	79.810	75.978	78.189	75.295	79.716	64.912	67.251	80.748    
    ]';  % age (year) kg, wet weight at f and T
data.tW(:,1) = data.tW(:,1) * 365; % yr to day
data.tW(:,2) = data.tW(:,2) * 1e3; % kg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'female'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MarkBjor1989';
comment.tW = 'Data for females';

% t-Ww data males
data.tWm = [ ...
1.964	23.971	16.922	9.909	8.989	7.929	11.044	13.918	20.964	11.861;
50.671	91.528	82.628	79.131	94.416	94.795	101.484	105.379	102.354	89.181        
    ]';  % kg, wet weight at f and T
data.tWm(:,1) = data.tWm(:,1) * 365; % yr to day
data.tWm(:,2) = data.tWm(:,2) * 1e3; % kg to g
units.tWm   = {'d', 'g'};  label.tWm = {'time since birth', 'wet weight', 'male'};  
temp.tWm    = C2K(37);  units.temp.tWm = 'K'; label.temp.tWm = 'temperature';
bibkey.tWm = 'MarkBjor1989';
comment.tWm = 'Data for males';
  
% L-W data (males and female together)
data.LW = [ ... % total length (cm), wet weight (kg) 
68.99	70.29	72.37	73.35	75.42	76.29	76.95	76.09	75.33	76.21	78.17	74.04	78.07	79.48	80.92	81.02	82.11	81.11	80.79	80.23	79.03	78.93	82.64	84.61	84.17	84.18	86.26	85.29	87.78	87.99	89.30	88.10	91.18	91.17	91.17	91.49	90.19	93.47	92.04	94.56	96.19	101.47	102.03	103.01	104.43	105.29	102.88	107.14	108.03	108.04	108.27	110.33	110.22	109.89	109.99	111.98	112.08	113.95	114.04	117.00	117.00	119.19	119.18	123.12	122.05	126.78	129.00	134.76	139.87	139.90	140.80	139.64	144.20	145.86	145.74	149.66	147.66	147.62	156.03	158.24;
11.55	8.68	9.85	8.66	9.49	7.30	10.15	12.18	13.70	15.04	15.53	19.77	17.89	15.69	21.41	17.03	17.70	12.15	14.67	8.79	9.97	11.82	11.80	12.80	14.48	16.84	16.99	20.37	16.48	14.12	13.27	11.93	19.99	17.80	16.62	15.11	17.14	18.97	17.46	17.95	17.26	29.52	32.38	31.70	33.88	28.48	26.65	27.29	30.65	34.69	37.55	32.99	33.84	31.99	30.47	38.03	36.18	39.70	33.14	38.34	38.00	39.67	35.96	39.64	46.05	58.14	69.06	59.09	52.83	63.27	70.84	82.12	75.02	82.42	80.23	75.15	64.73	86.45	89.08	63.82    
    ]';   
data.LW(:,2) = data.LW(:,2) * 1e3; % kg to g
units.LW = {'cm', 'g'};     label.LW = {'length', 'wet weight'};  
bibkey.LW = 'MarkBjor1989';

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
set1 = {'tL'; 'tLm'}; subtitle1 = {'data for female, male'};
set2 = {'tW'; 'tWm'}; subtitle2 = {'data for female, male'};
metaData.grp.sets = {set1; set2};
metaData.grp.subtitle = {subtitle1; subtitle2};

%% Discussion points
D1 = 'males and females assumed to differ by {p_Am}';
D2 = 'The parameter t_0 is fixed at 76 d (treated as an observation)';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'The total gestation time includes 76 days of delayed implantation.';
metaData.bibkey.F1 = 'AnAge'; 
F2 = 'Midsized phocid seal that varies in size across the range of the species';
metaData.bibkey.F2 = 'KovaLyde'; 
F3 = 'Dimorphic sexes';
metaData.bibkey.F3 = 'KovaLyde'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4GK65'; % Cat of Life
metaData.links.id_ITIS = '180649'; % ITIS
metaData.links.id_EoL = '46559162'; % Ency of Life
metaData.links.id_Wiki = 'Phoca_vitulina'; % Wikipedia
metaData.links.id_ADW = 'Phoca_vitulina'; % ADW
metaData.links.id_Taxo = '67459'; % Taxonomicon
metaData.links.id_WoRMS = '137084'; % WoRMS
metaData.links.id_MSW3 = '14001060'; % MSW3
metaData.links.id_AnAge = 'Phoca_vitulina'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoca_vitulina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Phoca_vitulina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KovaLyde'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.npolar.no/en/species/harbour-seal.html}}';
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
bibkey = 'KovaLavi1986'; type = 'Article'; bib = [ ... 
'author = {Kovacs, K. M. and Lavigne, D. M.}, ' ... 
'year = {1986}, ' ...
'title = {Maternal investment and neonatal growth in phocid seals}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {55}, ' ...
'pages = {1035-1051}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarkBjor1989'; type = 'Article'; bib = [ ... 
'author = {Markussen, N. H. and Bj{\o}rge, A. and {\O}Ritsland, N. A.}, ' ... 
'year = {1989}, ' ...
'title = {Growth in harbour seals (\emph{Phoca vitulina}) on the {N}orwegian coast}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {219}, ' ...
'number = {3}, '...
'doi = {10.1111/j.1469-7998.1989.tb02591.x}, '...
'pages = {433-440}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

