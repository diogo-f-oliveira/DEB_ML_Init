function [data, auxData, metaData, txtData, weights] = mydata_Serranus_scriba  

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Serranus_scriba'; 
metaData.species_en = 'Painted comber (CAB population)'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wd0'; 'Wwb'; 'Wwp'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Andrea Campos-Candela'};    
metaData.date_subm = [2017 05 04];              
metaData.email    = {'acampos@imedea.uib-csic.es'};            
metaData.address  = {'IMEDEA-CSIC,07190, Spain'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 06 21]; 

%% set data
% zero-variate data
  data.ap = 365;    units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'AlonAlos2011'; 
    comment.ap= 'Younger individual reported with mature gonads in Cabrera Reserve';
    temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature';  
data.am = 11*365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'AlonAlos2011';
    comment.am= 'Elder individual reported with mature gonads in Cabrera Reserve';
    temp.am = C2K(18.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb = 0.13;   units.Lb = 'cm';  label.Lb = 'total length at birth';   bibkey.Lb = 'Alva2017';  
  comment.Lb = 'min length of larvae with opened mounth';
data.Lp = 8.7;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'AlonAlos2011'; 
  comment.Lp = 'TL of the younger individual reported with mature gondas in Cabrera Reserve';
data.Li = 28;   units.Li = 'cm';  label.Li = 'ultimate total length'; bibkey.Li  = 'AlonAlos2011'; 
  comment.Li= 'max. TL reported in Cabrera Reserve in June is 22.5 cm; Wiki gives 28 cm';

data.Wd0 = 1.0128e-5; units.Wd0 = 'g'; label.Wd0 = 'average egg dry weight'; bibkey.Wd0 = 'AlosAlon2013'; 
  comment.Wd0 = 'Cabrera population';
data.Wwb = (712.2409/(2*10000))^3*pi*(4/3); units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'AlosAlon2013'; 
  comment.Wwb='computed from egg diameter of 0.712 mm: 4/3*pi*(0.0712/2)^3';   
data.Wwp = 6.63;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'AlonAlos2011'; 
  comment.Wwp= 'Younger individual reported with mature gonads in Cabrera Reserve';

% uni-variate data
% t-L data
data.tL = [... 
     7	10	7	8	6	7	7	3	2	5	5	6	9	3	7	6	7	3	7	6	7	6	6	6	6	5	3	3	8	8	6	5	7	5	7	4	3	3	3	5	5	2	6	4	5	10	6	8	6	3	4	4	3	8	8	8	9	6	6	1	7	3	4	6	6	4	6	6	5	7	6	3	7	2	2	8	2	2	4	10	4	7	8	4	10	3	3	8	6	7	7	4	7	5	3	5	8	5	8	6	10	7	2	4	7	6	3	6	4	5	5	5	3	6	8	9	6	9	5	3	2	3	4	2	5	3	4	8	6	2	8	7	4	2	11	3	7	7	3	4	5	8	4	2	5	5	2	3	2	10	8	8	8	7	7	6	8	7	7	4	1	6	10	7	5	5	6	5	7	4	3	6	2	7	6	4	6	3	5	7	8	7	7	6	7	4	4	6	5	2	4	3	6	7	3	4	7	4	3	5	2	8	7	7	7	7	7	7	6	8	5	7	6	8	5	7	4	5	4	6	2	3	5	4	6	7	6	8	4	2	7	7	3	5	3	3	5	3	3	6	9	6	10	7	7	5	8	6	8	7	6	4	8	4	7	3	9	5	3	5	10	10;
    190	200	165	169	187	166	166	135	107	162	155	199	195	131	171	155	171	131	163	163	194	164	177	172	176	149	133	118	186	182	198	167	204	174	194	149	139	141	130	151	142	114	183	139	147	224	184	194	161	132	127	134	128	193	191	188	224	165	149	124	136	113	128	168	167	145	168	185	157	166	155	122	144	100	105	193	123	125	129	190	143	168	183	120	219	126	122	171	168	160	177	169	161	164	141	150	173	147	178	147	212	166	101	125	196	187	125	139	136	137	137	137	144	179	176	173	173	177	149	122	124	133	138	103	168	117	142	174	177	112	176	165	142	111	225	114	162	169	125	128	150	175	132	103	130	145	104	109	111	187	172	174	174	168	178	157	168	172	138	158	87	132	197	162	160	159	166	140	183	130	121	149	98	164	169	133	140	124	135	164	181	167	173	165	152	139	150	147	144	128	127	121	175	175	118	127	176	120	110	132	109	200	170	161	166	168	166	168	160	186	140	163	158	180	148	185	148	151	142	148	111	132	130	141	137	169	160	155	124	119	153	174	110	157	122	121	135	118	127	172	196	165	215	170	170	137	184	172	170	178	163	142	204	140	166	124	212	141	129	159	226	165
    ]';  % mm, total length at f and T
data.tL (:,1)= data.tL (:,1)* 365; % years to days 
data.tL (:,2)= data.tL (:,2)/10; % mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AlosPalm2010'; comment.tL='Cabrera Reserve in Mallorca Islands';

% % L-W data
data.LW_BAH = [ ... % total wet weight (g)  
	119	117	160	120	125	165	135	105	80	156	135	142	134	114	99	106	131	163	109	99	125	143	151	130	134	101	109	97	95	97	90	89	115	116	106	91	86	81	90	96	102	112	98	96	104	135	105	115	110	163	126	145	147	113	85	81	125	124	124	113	112	98	125	110	110	104	84	80	75	83;	
    20.782	16.946	54.773	23.072	26.081	60.754	33.853	15.284	7.7	49.5	32.604	41.766	32.214	19.812	12.693	16.488	30.517	58.501	16.722	11.643	28.59	40.426	50.954	30.344	34.193	14.288	17.704	12.513	12.906	12.94	10.354	9.848	20.874	21.361	16.702	10.19	8.697	6.477	9.98	11.172	12.905	17.537	12.415	12.015	15.727	31.284	14.525	21.299	18.127	58.733	27.575	43.457	42.711	21.411	8.036	6.147	27.687	26.013	23.487	18.522	18.241	12.537	24.536	17.747	14.995	14.468	7.27	7.187	5.677	7.859
    ]';   
data.LW_BAH (:,1)= data.LW_BAH (:,1)/10; % mm to cm
units.LW_BAH = {'cm', 'g'};    label.LW_BAH = {'total length', 'wet weight'};  
temp.LW_BAH    = C2K(18.5);  units.temp.LW_BAH = 'K'; label.temp.LW_BAH = 'temperature';
bibkey.LW_BAH = 'AlonAlos2011';
comment.LW_BAH = 'Palma Bay in Mallorca Islands';

% L-N data
data.LN = [ ... % length (cm), Fecundity (#eggs/batch) 
  87	101	124	103	112	111	103	104	111	98	128	125	144	133	117	114	125	109	121	125	136	138	142	128	158	130	133	139	150	127	149	168	150	130	145	160	159	140	135	144	187	139	179	173	157	166	149	169	140	147	166	165	162	169	168	178	172	138	162	164	164	167	173	152	176	174	176	175	172	168	173	187	197	225;
	149.21052632	351.01754386	814.3943662	212.24242424	1612.78082192	1277.98850575	1474.93421053	1947	2001.06741573	1380.89855072	4297.41573034	1849.45652174	1152.27272727	2277.8961039	1538.37209302	2330	4783.06849315	926.01652893	4001.92592593	1089.2027027	965.31884058	611.36619718	3759.88636364	2647.68	4864	3131.97402597	3884.43373494	4954.36363636	8334.9	3493.18055556	3115.23529412	6391.41176471	4149.02912621	1170.2173913	3215.94444444	4204.4	1851.46666667	4775.94936709	3579.74683544	7977.78947368	5091	1330	2259.29268293	2799.85542169	2765.14666667	7729.36363636	4732.95959596	7427.46031746	4504.5	7000.4494382	1908.94736842	5104.66666667	14460.83333333	7292.71666667	7243.92708333	5845.19417476	7492.75	3734.19753086	6230.5915493	8310.07692308	6722.625	3691.42857143	270.625	5872.5	4399.40229885	4762.90566038	8721.23076923	8918.62637363	5641.01204819	5971.23333333	1384.02061856	6635.05747126	6340.29850746	10914.29126214
    ]'; 
data.LN (:,1)= data.LN (:,1)/10;  % convert mm to cm
data.LN (:,2)= data.LN (:,2) * 4; % #, yearly fecundity
temp.LN    = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
units.LN = {'cm', '#'};     label.LN = {'total length', 'Fecundity'};  
bibkey.LN = 'AlosAlon2013';
comment.LN = 'field data provided the #eggs/batch in May or June; assuming 4 spawnings per yr, as the spawning season extends from May to August, with a peak of spawning activity between May and June in the western Mediterranean (Alonso-Fernandez et al. 2011)';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
% auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'kap_R is set to 0.95/2 because of being hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Hermaphroditic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YL63'; % Cat of Life
metaData.links.id_ITIS = '167862'; % ITIS
metaData.links.id_EoL = '46579259'; % Ency of Life
metaData.links.id_Wiki = 'Serranus_scriba'; % Wikipedia
metaData.links.id_ADW = 'Serranus_scriba'; % ADW
metaData.links.id_Taxo = '187467'; % Taxonomicon
metaData.links.id_WoRMS = '127043'; % WoRMS
metaData.links.id_fishbase = 'Serranus-scriba'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Serranus_scriba}}';
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
bibkey = 'AlosPalm2010'; type = 'Article'; bib = [ ... 
'author = {Al\''{o}s, J. and Palmer, M. and Balle, S. and Grau, A. M. and Morales-Nin, B.}, ' ... 
'year = {2010}, ' ...
'title = {Individual growth pattern and variability in \emph{Serranus scriba}: a {B}ayesian analysis}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {67}, ' ...
'number = {3}, '...
'pages = {502--512},'...
'doi = {10.1093/icesjms/fsp265},'...
'howpublished = {url{http://dx.doi.org/10.1093/icesjms/fsp265}},'...
'eprint = {/oup/backfile/content_public/journal/icesjms/67/3/10.1093/icesjms/fsp265/2/fsp265.pdf}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlonAlos2011'; type = 'Article'; bib = [ ... 
'author = {Alonso-Fern\''{a}ndez, A. and Al\''{o}s, J. and Grau, A. and Dom\''{i}nguez-Petit, R. and Saborido-Rey, F.}, ' ... 
'year = {2011}, ' ...
'title = {The use of histological techniques to study the reproductive biology of the hermaphroditic Mediterranean fishes \emph{Coris julis}, \emph{Serranus scriba} and \emph{Diplodus annularis}}, ' ...
'journal = {Mar Coast Fish.}, ' ...
'volume = {3}, ' ...
'pages = {145--159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlosAlon2013'; type = 'Article'; bib = [ ... 
'author = {Al\''{o}s, J. and Alonso-Fern\''{a}ndez, A. and Catal\''{a}n, I. A. and Palmer, M. and Lowerre-Barbieri, S.}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive output traits of the simultaneous hermaphrodite \emph{Serranus scriba} in the western {M}editerranean}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {77}, ' ...
'number = {2}, '...
'pages = {331--340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Camp2016'; type = 'Misc'; bib = [ ... 
'author = {Campos-Candela, Andrea}, ' ... 
'title = {Personal lab observation, 2016}, ' ...
'year = {2016}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Alva2017';type = 'Misc'; bib = [ ... 
'author = {Alvarez-Ellacuria, Itziar}, ' ... 
'title = {Personal lab observation, 2017},' ...
'year = {2017}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

