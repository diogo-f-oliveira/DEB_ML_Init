function [data, auxData, metaData, txtData, weights] = mydata_Actinonaias_ligamentina 

% http://www.debtheory.org/wiki/index.php?title=Mydata_file#Metadata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Actinonaias_ligamentina'; 
metaData.species_en = 'Mucket'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'L-Ww'; 'L-Wd'; 'Ww-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author   = {'Adrian Moore'};    
metaData.date_subm = [2019 04 01];              
metaData.email    = {'moorea@umn.edu'};            
metaData.address  = {'Dept Ecol, Evol and Behaviour, Univ of Minnesota, Twin Cities, USA'};   

metaData.author_mod_1   = {'Adrian Moore'};    
metaData.date_mod_1 = [2020 03 27];              
metaData.email_mod_1    = {'moorea@umn.edu'};            
metaData.address_mod_1  = {'Dept Ecol, Evol and Behaviour, Univ of Minnesota, Twin Cities, USA'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 03 28]; 

%% set data
% zero-variate data

data.ab = 14;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ZaleNeve1982';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1370;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'Jirk1986';
  temp.tp = C2K(15.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14965;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SansAtki2016';   
  temp.am = C2K(19.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .0254;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Jirk1986';  
data.Lp  = 5.85;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Jirk1986'; 
data.Li  = 18.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MNDNR';

data.Wwb = .00000053;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Pate1985'; 
  comment.Wwb = 'data are for Elliptio complanata in Canada';
data.Wwp = 25;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'StJo1973';
  comment.Wwp = 'Wet weight includes shell and environmental water';
data.Wwi = 1017;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'StJo1973';
  comment.Wwi = 'Wet weight includes shell and environmental water';

data.Ri  = 4277;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MoleLayz2008';   
  comment.Ri = 'maximum yearly fecundity divided by 365'; 
temp.Ri = C2K(15);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
  
% L-W data
data.LW = [ ... % total shell length (cm), wet weight (g) 
4.345	5.083	5.134	4.662	5.318	5.241	5.435	5.758	6.166	5.929	6.092	6.09	6.207	6.191	6.301	6.385	6.181	6.188	6.261	6.477	6.162	6.811	6.584	5.811	6.296	6.536	6.478	6.457	6.757	6.597	6.981	6.839	6.918	6.923	6.734	6.602	6.778	6.831	6.963	6.862	7.084	6.952	6.855	6.79	6.903	7.223	6.936	7.117	7.165	6.901	6.86	6.983	7.444	7.121	6.917	7.355	7.401	7.212	8.146	6.962	7.095	7.209	6.849	7.401	7.261	7.14	7.362	7.746	7.396	7.159	7.25	7.478	7.403	7.48	7.311	7.376	7.885	7.324	7.407	7.236	7.442	7.521	7.042	7.062	8.474	7.949	7.769	7.542	7.472	7.333	7.82	7.731	7.149	7.18	7.341	7.562	7.227	7.399	7.723	7.247	7.436	7.554	7.564	7.328	7.906	7.285	7.437	7.733	7.758	7.655	7.176	7.765	7.451	8.05	7.858	7.386	7.708	7.752	7.32	7.586	7.889	7.744	8.002	7.324	7.714	7.502	7.524	7.53	7.552	7.753	7.852	7.655	7.844	8.364	7.625	8.024	7.298	7.646	7.95	8.2	8.254	7.884	7.884	8.331	7.664	7.618	8.091	7.566	8.021	8.107	8.365	8.152	8.118	7.445	7.52	7.853	8.031	8.087	8.12	8.015	8.035	8.113	8.129	8.353	7.959	8.053	7.643	7.562	8.103	8.054	8.049	8.141	8.115	8.02	9.114	7.861	7.575	8.064	7.569	8.029	8.302	8.051	8.13	8.363	8.21	7.845	8.01	8.413	8.521	7.912	7.751	8.038	8.304	8.342	8.687	8.654	7.79	8.77	7.785	8.725	8.672	8.178	8.422	8.455	8.203	8.128	8.082	7.872	8.046	8.197	8.129	8.368	8.122	8.581	8.308	8.407	7.997	8.161	8.085	8.575	8.126	8.632	8.471	8.928	8.448	8.241	8.392	7.993	8.162	8.658	8.643	8.953	7.905	8.115	8.191	8.306	8.644	8.62	8.977	8.252	8.237	9.028	8.744	8.747	8.54	8.386	8.063	8.332	8.679	8.354	8.45	8.667	8.394	8.631	8.631	8.741	8.3	8.428	8.408	8.628	8.695	8.356	8.83	8.831	8.517	9.007	8.542	8.53	8.931	8.922	8.683	8.59	8.613	8.529	8.564	8.464	8.918	9.141	8.449	9.75	8.543	8.55	8.979	9.05	8.813	8.577	9.122	9.021	8.77	8.974	8.815	9.787	8.921	8.751	8.977	9.054	8.749	9.015	8.97	9.162	9.156	9.199	9.023	8.952	9.111	9.221	9.203	8.674	8.727	8.986	8.675	8.838	9.838	9.819	9.229	9.449	9.296	9.322	8.878	9.623	9.802	9.926	9.734	9.915	9.569	9.29	9.774	9.964	10.425	10.204	10.209	10.716	10.45;
9.4	16.7	17.1	17.2	18.9	19	25.3	25.4	30.4	32	32.6	34.500	34.5	36.1	36.7	38.1	38.2	38.700	39	39.5	40.6	40.8	40.9	41.1	41.7	41.9	42.000	42.6	44.7	46.2	46.5	46.900	47.1	47.4	47.6	49	49.3	50.5	50.8	51.5	51.7	51.800	52.6	52.800	53	53.8	53.9	53.9	54.5	54.6	54.7	54.700	55	55.1	55.2	55.3	55.4	55.8	55.9	56	56.2	56.6	57.2	57.7	58	58.2	58.4	58.8	59.000	59.400	59.500	59.500	59.9	60.1	60.400	60.6	60.6	60.8	60.8	61.2	61.4	61.4	62	62.5	62.700	63	63.1	63.2	63.7	64.5	64.6	64.9	65.3	65.600	65.800	65.9	66	66	66.5	66.700	66.700	66.7	66.800	67	67.5	67.7	68.1	68.1	68.200	68.500	68.8	69.200	69.4	69.4	70	70.2	70.200	70.200	70.4	70.7	70.700	71	71.3	71.6	71.8	72.200	72.2	72.6	72.7	72.7	72.8	72.9	72.9	72.9	73	73.6	73.7	73.7	74	74.8	74.9	75.200	75.200	75.3	75.5	75.800	75.900	76	76.3	76.500	76.6	77.100	77.7	78	78.2	78.600	78.8	78.9	78.9	79.3	79.800	79.9	80.000	80	80.100	80.1	80.6	80.9	81.4	81.6	81.900	81.9	82	82.1	82.1	82.2	82.4	82.700	82.9	82.900	82.900	83	83.000	83.4	83.700	83.8	83.8	84.2	84.6	84.7	84.8	84.800	86.2	86.5	86.700	86.800	87.000	87.000	87.1	87.5	87.6	87.7	88.1	88.1	88.3	88.700	88.8	88.9	88.900	89	89.200	89.2	90	90.000	90.3	90.5	90.7	91	91.5	91.500	92	92.3	92.7	92.7	92.9	93.1	93.1	93.3	93.300	93.4	93.7	93.7	94.000	94	94.6	94.9	95	96.000	96.200	96.5	96.7	97	97.8	97.9	98	98.5	98.6	98.700	98.9	99.500	99.7	99.8	100.500	100.700	100.700	101.2	101.4	102.600	102.7	102.700	102.7	103	103.5	103.5	103.8	103.8	104.2	104.6	104.9	105.100	105.5	105.9	106.5	106.6	106.6	106.8	106.8	107.4	108	108.1	108.7	109.2	109.7	109.7	109.8	110.1	110.4	110.5	111.2	111.5	113.9	114.500	115.6	116.800	116.9	117.5	118	118.2	118.8	119.1	120.3	120.5	120.6	122.8	124.1	125.2	125.6	127.1	127.1	127.6	129	129.8	131.1	131.9	132.4	132.7	137.2	137.8	137.9	143.9	143.9	145.4	146	147	154.5	160.6	172.6	180.2	180.3	182.2	189.8	201.8	204.5
]';   
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Horn2019';

%length-dry weight
data.LWd = [... %total shell length (cm), tissue dry weight (g) 
 7.12	7.44	7.56	7.76	7.77	8.091	8.318	8.32	8.34	8.378	8.4	8.422	8.525	8.789	8.863	8.95	9.06	9.068	9.17	9.24;
0.7332	0.9032	1.1549	1.1978	0.809	1.2481	1.4509	1.5041	1.2946	1.2937	1.1682	1.33	1.4361	1.6727	1.4358	2.0859	2.0282	1.6116	1.6908	2.2889
]';
units.LWd = {'cm', 'g'}; label.LWd = {'total length', 'tissue dry weight'};
bibkey.LWd = 'Horn2019';

%wd-wa 	dry weight, ash-free dry weight
data.WdWa = [... %tissue dry weight (g) tissue ash free dry weight (g) 
0.7332	0.9032	1.1549	1.1978	0.809	1.2481	1.4509	1.5041	1.2946	1.2937	1.1682	1.33	1.4361	1.6727	1.4358	2.0859	2.0282	1.6116	1.6908	2.2889;
0.4783	0.6701	0.842	0.8102	0.5417	0.7934	1.0479	1.0954	0.9212	0.9387	0.8588	0.8446	1.1128	1.2414	0.9297	1.5653	1.4599	0.9823	1.1488	1.8425
]';
units.WdWa = {'g','g'};  label.WdWa = {'dry weight', 'ash-free dry weight'};  
bibkey.WdWa = 'Horn2019';

%wd-ww Dry weight, total wet weight
data.WdWw = [ ... % dry weight (g), wet weight (g)
  0.726	0.7395	0.7455	1.0426	1.0688	1.0848	1.114	1.158	1.221	1.271	1.2827	1.341	1.345	1.351	1.381	1.489	1.492	1.643	1.679	1.757	1.815	1.871	1.9053	2.0453	2.135	2.329	2.431;
64.9	61.4	63.1	70.4	91.5	78.9	69.4	86.5	82.1	79.3	82.9	97.9	93.4	109.7	92.7	109.2	127.1	129.8	106.8	89.2	118.8	124.1	101.4	107.4	108	87.7	109.8
]'; 
units.WdWw = {'g','g'}; label.WdWw = {'tissue dry weight', 'total wet weight'};
bibkey.WdWw = 'Horn2019';
comment.WdWw = 'Wet weight includes shell and environmental water';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: LWd and WdWa data added, d_V estimated';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7SKBT'; % Cat of Life
metaData.links.id_ITIS = '80193'; % ITIS
metaData.links.id_EoL = '449465'; % Ency of Life
metaData.links.id_Wiki = 'Actinonaias'; % Wikipedia
metaData.links.id_ADW = 'Actinonaias_ligamentina'; % ADW
metaData.links.id_Taxo = '235338'; % Taxonomicon
metaData.links.id_WoRMS = '857466'; % WoRMS
metaData.links.id_molluscabase = '857466'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Actinonaias}}';
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
bibkey = 'Jirk1986'; type = 'phdthesis'; bib = [ ... 
'author = {Kurt J. Jirka}, ' ... 
'year = {1986}, ' ...
'title = {Reproductive biology and comparative growth rates of selected species of freshwater mussels ({B}ivalvia: {U}nionidae) in the {N}ew and {G}reenbrier {R}ivers, {V}irginia and {W}est {V}irginia}, ' ...
'school = {Virginia Polytechnic Institute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZaleNeve1982'; type = 'Article'; bib = [ ... 
'author = {Zale, Alexander V. and Neves, Richard J.}, ' ... 
'year = {1982}, ' ...
'title = {Reproductive Biology of Four Freshwater Mussel Species ({M}ollusca: {U}nionidae) in {V}irginia}, ' ...
'journal = {Freshwater Invertebrate Biology}, ' ...
'volume = {1}, ' ...
'number = {1}, '...
'doi = {10.2307/3259440}, '...
'pages = {17-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Pate1985'; type = 'Article'; bib = [ ... 
'author = {C. G. Paterson}, ' ... 
'year = {1985}, ' ...
'title = {Biomass and Production of the {U}nionid, \emph{Elliptio complanata} ({L}ightfoot) in an {O}ld {R}eservoir in {N}ew {B}runswick, {C}anada},' ...
'journal = {Freshwater Invertebrate Biology}, ' ...
'volume = {4}, ' ...
'number = {4}, '...
'pages = {201-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SansAtki2016'; type = 'Article'; bib = [ ... 
'author = {Brandon J. Sansom and Carla L. Atkinson and Caryn C. Vaughn}, ' ... 
'year = {2016}, ' ...
'title = {Growth and Longevity Estimates for Mussel Populations in Three {O}uachita {M}ountain Rivers}, ' ...
'journal = {Freshwater Mollusk Biology and Conservation}, ' ...
'volume = {19}, ' ...
'number = {2}, '...
'pages = {19-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Horn2019'; type = 'Misc'; bib = [ ... 
'author = {Hornbach, Daniel}, ' ...
'year = {2019}, ' ...
'note = {unpublished data from the St. Croix river, MN furnished by Daniel Hornbach}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MNDNR'; type = 'Misc'; bib = [ ... 
'author = {Minnesota DNR and Seitman, Bernard}, ' ...
'year = {2018}, ' ...
'note = {unpublished data from MN provided by the Minnesota Department of Natural Resources}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoleLayz2008'; type = 'Article'; bib = [ ... 
'author = {Moles, Kendall R. and Layzer, James B.}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive ecology of \emph{Actinonaias ligamentina} ({B}ivalvia: {U}nionidae) in a regulated river}, ' ...
'journal = {Journal of the North American Benthological Society}, ' ...
'volume = {27}, ' ...
'number = {1}, '...
'pages = {212-222}'];
%
bibkey = 'StJo1973'; type = 'phdthesis'; bib = [ ... 
'author = {St. John, Mary Elle Meikle Kindell}, ' ... 
'year = {1973}, ' ...
'title = {Shell growth and variation in the \emph{Actinonaias ligamentina} (Lamark, 1819) complex (Mollusca: Bivalvia: Unionidae)}, ' ...
'school = {The Ohi State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
