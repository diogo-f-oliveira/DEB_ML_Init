function [data, auxData, metaData, txtData, weights] = mydata_Dionda_diaboli

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Dionda_diaboli'; 
metaData.species_en = 'Devils River minnow'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc', '0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 25]; 

%% set data
% zero-variate data

data.ah = 5;   units.ah = 'd';  label.ah = 'age at hatch';  bibkey.ah = 'HulbBonn2007';   
  temp.ah = C2K(22.5); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'authors say most fish hatched at 5 days';
data.ab = 8 + data.ah;   units.ab = 'd';  label.ab = 'age at birth';  bibkey.ab = 'HulbBonn2007';   
  temp.ab = C2K(22.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'authors express age post hatch';
data.am = 2 * 365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'Wiki';   
  temp.am = C2K(22.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 0.58/0.84;  units.Lb = 'cm'; label.Lb = 'total length at birth'; bibkey.Lb = 'HulbBonn2007';
    comment.Lb = 'Day-8 mesolarva, converted from standard length see discussion';
data.Lp = 2.5/0.84;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishesOfTexas'; 
  comment.Lp = 'converted from standard length see discussion';
data.Li = 6.4;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 2.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = {'GibsFrie2005', 'guess'};
   comment.Wwb = 'based on egg diameter of 1.6 mm after GibsFrie2005: pi/6*0.17^3';
data.Wwi = 2.2;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';          bibkey.Wwi = {'fishbase', 'guess'};
   comment.Wwi = ' 0.00708 * 6.4^3.08, see discussion ';
    
data.Ri = 100/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(22.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for Phoxinus phoxinus: (6.4/14)^3*1e3 per yr';

% % univariate data

% time-length
data.tL = [ ... % days post hatch, standard length (mm)
2 mean([4.3,5.1])   
4 mean([5.1,5.8])   
8 mean([5.1,6.4])   
mean([16,32]) mean([5.8,8.1])   
mean([32,64]) mean([6.8,12])   
128 mean([10,29])   
];
data.tL(:,1) = data.tL(:,1) * 5; % convert month to time since start (fertilisation)
data.tL(:,2) = data.tL(:,2)/ 10/ 0.84; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length', 'HulbBonn2007'};  
temp.tL = C2K(22.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HulbBonn2007';
comment.tL = 'converted from standard length see discussion';
%
data.tL2 = [ ... % time since start (d), total length (mm)
3.289	2.632	1.974	2.632	3.289	9.868	11.184	11.184	19.737	20.395	19.079	19.737	26.316	26.316	26.316	26.974	26.316	26.316	26.316	34.868	34.868	34.868	34.868	34.868	34.211	34.868	34.868	40.132	40.789	40.132	40.789	41.447	40.789	40.132	40.132	40.132	47.368	48.026	48.684	48.026	47.368	47.368	48.026	48.026	46.711	47.368	48.026	47.368	53.947	54.605	55.263	54.605	53.947	53.947	53.947	55.263	54.605	54.605	55.263	61.184	61.184	62.5	61.842	63.158	61.184	61.842	61.842	61.842	61.842	61.184	61.842	62.5	61.842	69.737	69.079	68.421	68.421	68.421	67.763	67.763	69.737	67.763	68.421	68.421	68.421	69.079	76.316	75	75	76.316	76.316	75.658	75.658	74.342	76.316	76.316	75	76.316	74.342	74.342	82.895	82.895	82.895	83.553	82.895	82.895	82.895	82.895	84.211	82.895	82.895	82.895	82.895	83.553	82.895	81.579	89.474	89.474	88.816	90.789	90.132	88.816	89.474	90.132	89.474	90.789	89.474	89.474	89.474	90.132	89.474	89.474	90.132	100	100	99.342	100	100	100	100	99.342	99.342	99.342	98.684	101.316	99.342	100	100.658	100.658	99.342	108.553	108.553	107.895	109.868	107.895	107.895	109.868	109.868	107.895	108.553	109.211	108.553	108.553	108.553	108.553	109.211	108.553	109.211	108.553	114.474	112.5	115.132	114.474	114.474	113.816	115.132	115.132	113.816	114.474	115.132	115.132	113.158	115.132	116.447	114.474	115.132	121.053	121.711	121.053	122.368	122.368	121.711	121.711	121.711	122.368	121.711	121.711	122.368	121.711	121.711	121.711	121.711	121.711	121.711	122.368	122.368	122.368	128.947	129.605	128.947	128.289	128.947	128.947	128.947	128.947	128.289	128.289	129.605	128.289	128.947	128.947	129.605	128.289	128.289	128.289	128.289	128.947	127.632	136.184	136.184	135.526	135.526	135.526	135.526	135.526	136.842	136.842	136.184	136.184	136.184	135.526	136.184	136.184	135.526	136.842	142.763	143.092	142.434	142.434	142.763	142.434	142.434	142.434	142.763	143.092	143.092	142.763	142.434	143.092	134.211	142.763	142.763	142.763	142.763	143.092	149.013	149.671	149.342	149.671	149.671	149.342	149.013	149.342	149.013	150	149.671	149.671	149.342	149.671	149.671	149.671	149.342	157.895	156.908	158.553	157.895	157.237	157.237	157.566	157.237	157.895	157.566	157.237	156.908	157.566	157.237	157.895	157.237	163.816	163.816	163.816	163.816	163.816	163.816	163.487	163.487	163.158	163.816	163.158	163.158	163.487	163.487	164.145	164.474	171.053	170.395	169.737	170.724	170.395	170.395	169.737	170.395	171.053	170.724	170.395	170.066	171.053	170.066	170.395	177.961	177.632	177.303	177.303	177.303	177.632	176.974	176.974	177.303	176.974	177.632	177.632	177.632	177.961	176.974	177.303	177.632	178.289	183.553	185.197	184.868	185.197	184.868	184.868	184.868	184.211	184.539	183.882	184.868	184.211	183.882	184.539	184.539	185.197	184.211	192.434	192.434	191.447	191.776	191.776	191.447	190.789	191.447	191.118	191.118	191.118	191.447	191.776	191.776	189.803	191.447	191.776	391.447	392.105	391.447	391.776	391.447	391.118	391.447	391.776	391.776	390.789	391.118	391.447	392.105	391.118	390.789	391.776	392.434	412.5	412.171	412.829	412.5	412.5	412.5	412.5	412.5	412.5	412.829	412.5	412.171	412.5	412.5	412.171	;	
7.961	6.929	6.044	5.012	4.128	8.993	7.813	7.224	12.236	10.025	8.993	8.256	15.037	13.857	12.826	11.794	11.204	10.172	9.287	18.28	16.069	14.595	14.005	12.973	12.236	11.204	10.467	21.081	18.428	15.921	15.037	13.12	12.088	11.057	10.172	9.435	24.029	22.703	22.408	17.985	16.953	16.364	15.184	14.152	12.826	12.383	11.057	9.877	24.029	22.113	19.165	17.838	16.806	15.774	15.037	14.005	12.973	12.236	11.204	27.42	25.061	24.177	20.934	20.049	19.165	18.133	17.101	16.069	15.037	14.595	13.415	12.383	11.057	28.894	25.061	22.113	20.934	19.312	18.133	17.101	16.069	15.332	14.3	13.12	12.088	10.909	29.926	29.337	24.914	23.882	22.113	20.639	19.165	18.133	16.953	16.069	15.037	14.3	13.12	12.383	31.99	30.958	30.221	27.42	24.767	23.882	23.44	22.26	21.229	20.197	19.312	17.543	17.543	16.511	14.152	12.531	31.4	29.926	26.83	25.946	25.061	23.882	22.703	21.081	20.344	19.165	17.985	17.101	16.216	15.184	13.857	13.12	11.204	34.201	31.99	30.221	28.01	27.273	24.914	23.292	22.26	21.229	20.049	19.017	17.985	17.101	15.921	15.037	14.3	13.563	36.855	34.054	33.317	31.253	29.926	29.189	28.01	26.241	24.914	23.882	23.145	21.966	20.786	20.049	19.165	17.985	17.248	15.184	14.005	37.15	35.971	33.907	31.106	30.369	28.6	27.862	26.241	25.209	24.324	23.44	22.408	20.934	17.838	16.364	15.332	14.152	38.329	36.855	35.971	35.381	32.138	30.958	30.074	29.189	27.125	25.799	24.767	24.177	22.85	22.26	20.934	20.197	19.017	17.985	16.953	15.921	14.889	39.951	38.919	37.15	36.413	34.939	33.17	31.99	30.958	29.926	29.042	27.862	26.83	25.799	25.061	24.619	22.85	21.229	19.017	17.985	17.101	15.627	39.066	38.034	37.15	35.233	33.17	31.99	31.106	29.631	28.894	27.715	26.978	25.799	24.914	22.26	21.081	19.017	17.838	40.172	39.066	38.034	37.15	35.086	33.833	32.727	31.695	30.811	30.221	29.115	28.157	27.125	25.799	24.103	24.103	23.071	22.113	20.197	19.017	41.057	39.951	38.108	34.939	32.948	31.769	30.737	29.926	29.042	27.936	27.052	26.241	25.061	24.324	23.219	22.334	20.123	40.246	37.961	35.971	35.086	34.128	33.17	31.99	31.032	30.074	29.042	27.862	27.199	25.946	25.135	24.177	22.039	43.12	40.098	37.961	36.118	35.012	34.201	33.096	31.99	31.106	30.147	29.115	28.01	26.978	26.093	25.135	23.292	42.015	41.278	40.172	39.14	37.076	35.897	35.16	33.759	33.022	32.064	31.032	28.01	27.273	26.093	24.398	44.152	43.12	41.867	40.835	40.025	38.919	37.887	36.929	35.897	34.939	34.201	33.096	32.211	30.958	30	29.042	28.157	27.346	44.152	43.268	41.941	41.204	40.025	39.066	38.256	35.897	35.233	34.275	33.096	31.99	30.885	30.147	29.263	28.6	25.946	44.447	43.194	40.983	40.172	39.066	38.034	36.855	36.044	35.086	34.275	32.948	32.211	31.032	30.147	29.337	28.305	26.978	52.039	50.123	49.017	45.921	44.963	44.005	43.047	42.162	41.13	39.877	38.771	38.108	37.224	35.971	35.086	34.128	31.032	53.219	51.229	49.165	47.174	46.216	45.037	44.226	43.047	42.015	40.909	40.025	39.066	38.256	35.823	35.307	
]';
data.tL2(:,2) = data.tL2(:,2)/ 10; % convert mm to cm
units.tL2 = {'d', 'cm'}; label.tL2 = {'time since hatch', 'total length', 'GibsFries2005'};  
temp.tL2 = C2K(23);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'GibsFrie2005';

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
set1 = {'tL2','tL'}; subtitle1 = {'GibsFries2005, HulbBonn2007'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'standard length is 84.0 % TL ';
  metaData.bibkey.D1 = 'fishbase';
D2 = 'weight length relationship: Ww in g = 0.00708 * (TL in cm)^3.08 ';
  metaData.bibkey.D2 = 'fishbase';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '36B7T'; % Cat of Life
metaData.links.id_ITIS = '163514'; % ITIS
metaData.links.id_EoL = '1012693'; % Ency of Life
metaData.links.id_Wiki = 'Dionda_diaboli'; % Wikipedia
metaData.links.id_ADW = 'Dionda_diaboli'; % ADW
metaData.links.id_Taxo = '173181'; % Taxonomicon
metaData.links.id_WoRMS = '1013950'; % WoRMS
metaData.links.id_fishbase = 'Dionda-diaboli'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Devils_River_minnow}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Dionda-diaboli.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesOfTexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/dionda diaboli.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'HulbBonn2007'; type = 'article'; bib = [ ... 
'author = {Hulbert, J. and Bonner, T. H. and Fries, J. N. and Garrett, G. P. and Pendergrass, D. R.}, ' ...
'year = {2007}, ' ...
'title  = {EARLY DEVELOPMENT OF THE {D}EVILS {R}IVER MINNOW, \emph{Dionda diaboli} ({C}YPRINIDAE)}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'pages = {378--385}, ' ...
'volume = {52}, ' ...
'number = {3}, ' ...
'doi = {10.1894/0038-4909(2007)52[378:edotdr]2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GibsFrie2005'; type = 'article'; bib = [ ... 
'author = {J. R. Gibson and J. N. Fries}, ' ...
'year = {2005}, ' ...
'title  = {Culture Studies of the Devils River Minnow}, ' ...
'journal = {North American Journal of Aquaculture}, ' ...
'pages = {294--303}, ' ...
'volume = {67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'Kooy2010'; type = 'BookQ'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%