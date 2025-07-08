function [data, auxData, metaData, txtData, weights] = mydata_Scotophilus_kuhlii 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Scotophilus_kuhlii'; 
metaData.species_en = 'Lesser Asiatic yellow house bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Nina Marn'};    
metaData.date_subm = [2018 08 19];              
metaData.email    = {'nina.marn@gmail.com'};            
metaData.address  = {'Rudjer Boskovic Institute, 10000, Croatia'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 08 26]; 

%% set data
% zero-variate data
Tb = C2K(32);% body temp
data.tg = 110;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = {'BateKing2008','Hock1951'};   
  temp.tg = Tb;  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '105-115d';
data.tx = 49;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = {'ChenHuan2016','Hock1951'};   
comment.tx = 'Authors assume weaning between 6 and 8 weeks, temp guestimated see D1'; 
  temp.tx = Tb;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 256;    units.tp = 'd';    label.tp = 'age at puberty, guessed';           bibkey.tp = 'guess';
  temp.tp = Tb;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span, guessed';                bibkey.am = 'AnAge';   
  temp.am = Tb;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Value guestimated based on longevity of other Vespertilionidae in the An Age database'; 

data.Lb  = 1.84;   units.Lb  = 'cm';  label.Lb  = 'forearm length at birth';   bibkey.Lb  = 'ChenHuan2016';  
  comment.Lb = 'an aveage of 18 pups, 18.40mm + 1.21mm SD'; 
data.Lx = 4.8;    units.Lx = 'cm';    label.Lx = 'forearm length at weaning';   bibkey.Lx = 'Hock1951';   
  comment.Lx = 'Weaning at 6-8 weeks of age, forearm length at age of 5-6 weeks was 4.7 cm'; 
data.Li  = 5.15;   units.Li  = 'cm';  label.Li  = 'ultimate forearm length';   bibkey.Li  = 'ChenHuan2016';
  comment.Li = 'Back-calculated from size at onset of first flight reported as percentage of ultimate size'; 

data.Wwb = 3.46;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ChenHuan2016';
  comment.Wwb = 'an aveage of 18 pups, 3.46g + 0.37g SD; pup mass was 15% of mother''s mass';
data.Wwx = 17;    units.Wwx = 'g';    label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'Hock1951';   
  comment.Wwx = 'Weaning at 6-8 weeks of age, wet weight at age of 5-6 weeks was 16.4 g'; 
data.Wwi = 23.24;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ChenHuan2016';
  comment.Wwi = 'Back-calculated from size at onset of first flight reported as percentage of ultimate size; with 2 pups per femeale litter mass represented approximately 30\% of the maternal bodymass'; 

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ChenHuan2016';   
  temp.Ri = C2K(35);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data - maternally reared
% data.
tL_mt = [ 
    0	0.98	1.99	3.03	3.99	5	6	6.96	8.01	9.01	10.02	11.02	12.02	12.99	13.99	15.04	16	17	18.01	18.97	20.01	20.97	21.98	23.02	23.99	24.99	25.95	27	28	29	30.05	31.01	32.02	33.02	34.02	34.99	36.03	36.99	38.04	39	40	41.01	42.05	43.06	44.02	45.06	46.07	47.03	48.03	49.04
18.16	18.92	19.48	20.03	21.08	21.57	22.26	23.37	23.65	24.83	25.6	26.85	27.76	28.73	29.63	30.96	32.21	33.18	34.43	35.76	36.38	37.43	38.54	39.37	40	41.04	41.53	42.16	42.92	43.41	44.03	44.59	45.15	45.43	45.98	46.33	46.54	46.96	47.17	47.44	47.72	47.93	48.21	48.35	48.49	48.56	48.77	48.97	49.04	49.11
    ]'; tL_mt(:,2) = tL_mt(:,2)/10; % cm, forearm length at f and T
% units.tL_mt   = {'d', 'cm'};  label.tL_mt = {'time since birth', 'forearm length'};  
% temp.tL_mt    = C2K(35);  units.temp.tL_mt = 'K'; label.temp.tL_mt = 'temperature';
% bibkey.tL_mt = 'ChenHuan2016';

% t-L data - hand-reared
% data.tL_hr = [ 
tL_hr = [ 
    0	0.98	2.99	1.99	4.04	5	6	7.01	8.01	9.01	9.97	10.98	11.98	12.94	13.99	14.99	16	17	17.92	18.97	19.97	21.02	22.02	22.98	24.03	24.99	25.99	27	27.96	29	30.01	31.01	31.97	33.02	33.98	34.99	35.99	37.03	38.04	39	40	41.01	42.01	43.02	43.98	44.98	45.98	47.03	47.99	49.04
18.99	19.55	20.66	19.76	21.63	22.4	23.3	24.07	24.97	25.6	27.06	27.48	28.31	29.36	30.05	31.17	32.28	33.67	34.64	35.62	36.73	37.43	38.33	39.3	40.07	41.18	42.16	43.2	43.9	44.94	45.5	46.12	46.54	47.37	47.79	48.28	48.7	48.97	49.25	49.53	49.74	50.02	50.23	50.37	50.57	50.64	50.71	50.78	50.78	50.99
    ]'; tL_hr(:,2) = tL_hr(:,2)/10; % cm, forearm length at f and T
% units.tL_hr   = {'d', 'cm'};  label.tL_hr = {'time since birth', 'forearm length'};  
% temp.tL_hr    = C2K(35);  units.temp.tL_hr = 'K'; label.temp.tL_hr = 'temperature';
% bibkey.tL_hr = 'ChenHuan2016'; comment.tL_hr = 'Hand-reared pups presented higher growth rates (in mass and length) in the 4th and 5th weeks compared to maternally-reared pups';

% t-Ww data - maternally reared
data.tWw_mt = [ 0	1.04	2.02	3.06	4.03	5.01	6.01	6.99	8.03	9.04	10.01	11.02	11.96	13	13.98	15.02	16.03	17.04	17.97	19.02	19.96	20.96	21.97	22.95	23.99	24.96	25.97	26.98	27.95	28.93	29.97	30.94	31.95	32.96	33.97	34.97	35.98	36.99	37.96	38.97	39.95	40.95	41.93	42.94	44.99	45.99	46.97	47.94	48.98	43.94
3.43	3.48	3.57	3.82	3.94	4.35	4.49	4.86	5.12	5.41	5.8	6.26	6.59	7.03	7.42	8.02	8.6	9.11	9.4	10.05	10.43	10.87	11.28	11.57	12.05	12.32	12.71	13.12	13.33	13.6	14.03	14.28	14.61	14.93	15.22	15.58	15.65	15.92	16.09	16.26	16.81	16.88	17.08	17.2	17.61	17.71	18	18.07	18.5	17.54
    ]';  % g, total wet weight at f and T
units.tWw_mt   = {'d', 'g'};  label.tWw_mt = {'time since birth', ' wet weight', 'maternal-reared'};  
temp.tWw_mt    = C2K(35);  units.temp.tWw_mt = 'K'; label.temp.tWw_mt = 'temperature';
bibkey.tWw_mt = 'ChenHuan2016';
% t-Ww data - hand-reared
data.tWw_hr = [ 0	1.01	2.02	2.99	3.96	4.97	5.98	6.95	8	8.93	10.01	10.99	11.96	12.97	13.98	15.02	15.99	17	17.97	18.98	19.99	20.96	21.97	22.98	24.02	24.96	26	26.98	27.95	29.03	29.93	30.98	31.95	32.96	33.93	34.97	35.95	36.99	37.93	38.97	39.95	40.92	41.96	42.94	43.94	44.92	45.89	46.9	47.98	48.95
3.62	3.67	3.77	4.06	4.42	4.71	4.98	5.39	5.48	5.72	5.87	6.35	6.84	7.25	7.78	8.29	8.65	9.3	9.71	10.22	10.82	11.28	11.67	12.42	12.78	13.43	13.99	14.81	15.1	16.16	16.74	17.25	17.56	18.21	18.91	19.13	19.59	20.02	20.05	20.58	20.75	21.21	21.09	21.01	21.23	21.01	21.57	21.79	22.05	22.34
    ]'; % g,  wet weight at f and T
units.tWw_hr   = {'d', 'g'};  label.tWw_hr = {'time since birth', ' wet weight', 'hand-reared'};  
temp.tWw_hr    = C2K(35);  units.temp.tWw_hr = 'K'; label.temp.tWw_hr = 'temperature';
bibkey.tWw_hr = 'ChenHuan2016'; comment.tWw_hr = 'Hand-reared pups presented higher growth rates (in mass and length) in the 4th and 5th weeks compared to maternally-reared pups';

% L-W data
data.LW_mt = [tL_mt(:,2) data.tWw_mt(:,2)]; % for control, weight zero in estimation to not use same data too many times
units.LW_mt = {'cm', 'g'};     label.LW_mt = {'total length', 'wet weight', 'maternal-reared'};  
bibkey.LW_mt = 'ChenHuan2016';

data.LW_hr = [tL_hr(:,2) data.tWw_hr(:,2)]; % for control, weight zero in estimation to not use same data too many times
units.LW_hr = {'cm', 'g'};     label.LW_hr = {'total length', 'wet weight', 'hand-reared'};  
bibkey.LW_hr = 'ChenHuan2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0.1 * weights.tp ;  % no species-specific data
weights.am = 0.1 * weights.am ; % no species-specific data
weights.Lb = 2 * weights.Lb ; 
weights.Wwb = 5 * weights.Wwb ; 
weights.Wwi = 5 * weights.Wwi ; 
% weights.tL_mt = 5* weights.tL_mt; 
weights.tWw_mt = 5* weights.tWw_mt;
% weights.tL_hr = 5* weights.tL_hr; 
weights.tWw_hr = 5* weights.tWw_hr;
% weights.LW_mt = 0* weights.LW_mt ; % combo of tL and tW datasets; weight zero in estimation to not use same data too many times
% weights.LW_hr = 0* weights.LW_hr ; % combo of tL and tW datasets; weight zero in estimation to not use same data too many times

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.5;  units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 0; % check for the value of k
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'diapause (at start of gestation)';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_mt', 'tWw_hr'}; subtitle1 = {'maternally and hand-reared'};
set2 = {'LW_mt', 'LW_hr'}; subtitle2 = {'maternally and hand-reared'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperature modelled as constant and estimated from: the distribution range of the species (BateKing2008) & average temperatures in Taipei (30-35C) during June-August when the study was conducted & body temperatures of Vespertilionidae at 30+C temperatures (Hock1951)';
D2 = ['Data choices: Forearm length (Lb,Lx,tL_f; available in ChenHuan2016) but not used because growth of forearm is allometric. ', ...
    'Age at puberty and max lifespan guessed based on other bats of the same family in the AmP'];     
D3 = 'For better (forearm) length predictions, shape coefficient should not be constant (as is currently)';     
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'The investment of female bats during the pregnancy and lactation period is relatively high. Intermediate development stage at birth (falling between precocial and altricial)';
metaData.bibkey.F1 = 'ChenHuan2016'; 
F2 = 'No significant difference between sexes in size at birth';
metaData.bibkey.F2 = 'ChenHuan2016'; 
F3 = 'Pups hang on mother during first 3 weeks (14-29 days); Onset of first flight at 35-43 days(5-6 weeks) of age with a forearm length 47.40 mm (+- 1.16mm) and body mass of 16.39 g (+- 2.40g)';
metaData.bibkey.F3 = 'ChenHuan2016'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4VY5J'; % Cat of Life
metaData.links.id_ITIS = '632151'; % ITIS
metaData.links.id_EoL = '310390'; % Ency of Life
metaData.links.id_Wiki = 'Scotophilus_kuhlii'; % Wikipedia
metaData.links.id_ADW = 'Scotophilus_kuhlii'; % ADW
metaData.links.id_Taxo = '64970'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801973'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'AnAge'; type = 'Misc'; bib = [...
'howpublished = {\url{http://genomics.senescence.info/species/query.php?search=Vespertilionidae}}, ' ...
'note = {Last accessed on 2018/08/14}' ];
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
bibkey = 'BateKing2008'; type = 'Misc'; bib = [ ... 
 'author = {Bates, P. and Kingston, T. and Francis, C. and Rosell-Ambal, G. and Heaney, L. and Gonzales, J.-C. and Molur, S. and Srinivasulu, C.}, ' ... 
'year = {2008}, ' ...
'title = {\textit{Scotophilus kuhlii}}, ' ...
'journal = { The IUCN Red List of Threatened Species 2008}, ' ...
'pages = {e.T20068A9142479}, ' ...
'doi = {10.2305/IUCN.UK.2008.RLTS.T20068A9142479.en}, '...
'note = { Downloaded on 14 August 2018}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChenHuan2016'; type = 'Article'; bib = [ ... 
'author = {Chen, Shiang-Fan and Huang, Shang-Shang and Lu, Dau-Jye and Shen, Tsung-Jen}, ' ... 
'journal = {Zoo Biology}, ', ...
'title = {Postnatal growth and age estimation in \emph{Scotophilus kuhlii}}, ' ...
'year = {2016}, ' ...
'volume = {35}, ', ...
'number = {1}, ', ...
'pages = {35--41}, ', ...
'doi = {10.1002/zoo.21251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hock1951'; type = 'Article'; bib = [ ... 
'author = {Hock, Raymond J.}, ', ...
'title = {The metabolic rates and body temperatures of bats}, ', ...
'journal = {The Biological Bulletin}, ', ...
'volume = {101}, ', ...
'number = {3}, ', ...
'pages = {289--299}, ', ...
'year = {1951}, ', ...
'doi = {10.2307/1538547}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

