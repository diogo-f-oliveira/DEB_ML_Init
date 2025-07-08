function [data, auxData, metaData, txtData, weights] = mydata_Sparus_aurata 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Sparus_aurata'; 
metaData.species_en = 'Gilt-head bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2013 01 31];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15];



%% set data
% zero-variate data

data.ah = 3;      units.ah = 'd';    label.ah = 'age at hatch';            bibkey.ah = 'LikaKooy2014';   
  temp.ah = C2K(17.5); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(17.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 100;    units.aj = 'd';    label.aj = 'age at metam';            bibkey.aj = 'LikaKooy2014';
  temp.aj = C2K(19);   units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'fins are formed and the animal looks like a minitiature version of the adult';
data.ap = 3*365;  units.ap = 'd';    label.ap = 'age at puberty';          bibkey.ap = {'Anon2008', 'fishbase'};
  temp.ap = C2K(19);   units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(20);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.226; units.Lh  = 'cm';  label.Lh  = 'total length at hatch';  bibkey.Lh  = 'LikaKooy2014';  
data.Lb  = 0.363; units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'LikaKooy2014';  
data.Lp  = 36.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = {'fishbase','Anon2008','KralDulc1997'}; 
data.Li  = 70;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 0.16e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'LikaKooy2014';
data.Wwj = 1.5;   units.Wwj = 'g';   label.Wwj = 'wet weight at metam';    bibkey.Wwj = 'LikaKooy2014';
data.Wwp = 500;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
data.Wwi = 17200; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'Papa2013';   
temp.GSI = C2K(17.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
L1 =[0.01	2.00	6.00	8.00	10.00	14.00	16.00	20.00	22.00	26.00...
    29.00	33.00	34.00	37.00	38.00	40.00	43.00	45.00	46.00	49.00...
    51.00	52.00	55.00	57.00	58.00;	...	
2.93	3.72	3.91	3.83	4.10	4.45	5.10	5.67	6.00	6.30	6.66...
7.28	7.76	8.77	8.48	9.07	8.84	11.64	11.82	12.96	13.31	14.16	13.58	13.28	14.64	]'	;
L2 =[1.00	3.00	5.00	7.00	9.00	12.00	13.00	17.00	19.00	23.00	...
    25.00	30.00	35.00	36.00	39.00	41.00	42.00	44.00	47.00	48.00	...
    50.00	53.00	54.00	56.00	59.00	60.00;	...
3.65	3.71	3.78	3.95	3.92	4.32	4.38	5.05	5.39	5.94	6.39	...
7.59	8.07	8.20	9.00	10.07	11.34	9.74	11.67	13.59	11.71	13.90	13.72	14.18	14.51	15.89	]';
L3 =[0.02	3.01	6.01	9.01	11.01	15.01	17.01	21.01	23.01	27.01	29.01...
    33.01	35.01	36.01	39.01	41.01	42.01	45.01	47.01	48.01	51.01	53.01...
    54.01	57.01	59.01	60.01;...	
2.92	3.73	3.91	3.82	3.95	4.04	4.10	4.67	5.20	5.41	6.08	...
6.26	6.33	7.16	7.27	7.17	7.63	7.95	8.73	8.48	8.79	10.91	10.77	11.35	11.67	13.05]';	
L4 =[1.01	2.01	6.02	8.01	10.01	14.01	16.01	20.01	22.01	26.01	28.01	...
    32.01	34.01	37.01	38.01	40.01	43.01	44.01	46.01	49.01	50.01	52.01	55.01	56.01	58.01;	...	
3.54	3.51	3.77	3.79	3.92	4.01	4.40	4.53	4.75	5.27	6.13	6.52...
6.38	7.17	7.37	7.69	7.65	7.91	7.88	8.86	9.87	9.75	10.62	11.49	12.78]';		
L5 =[0.03	2.02	3.02	6.03	8.02	12.02	14.02	19.02	20.02	24.02	26.02...
    30.02	32.02	35.02	38.02	41.02	43.02	44.02	47.02	49.02	50.02	53.02	55.02	56.02	59.02;	...	
3.01	3.67	3.75	3.81	3.83	3.96	4.13	4.33	4.62	5.47	5.51	6.12...
6.42	6.75	6.96	7.27	7.59	8.32	8.24	8.04	9.90	10.64	11.69	12.96	13.23]';		
L6 =[1.03	5.03	7.03	9.03	11.03	15.03	17.03	21.03	23.03	27.03	29.03	...
    33.03	34.03	36.03	37.03	39.03	40.03	42.03	45.03	46.03	48.03	51.03	52.03	54.03	57.03	58.03	60.03;...
3.51	3.83	3.96	3.86	3.92	4.35	4.53	5.42	5.37	5.69	6.06...
6.84	6.86	7.36	7.38	7.30	7.89	8.48	10.53	9.20	10.88	12.04	10.88	12.17	11.63	13.26	12.97]';
data.tL = sort([L1; L2; L3; L4; L5; L6], 1);
data.tL(:,2) = data.tL(:,2)/ 10;       % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(19.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LikaKooy2014';
  
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

%% Links
metaData.links.id_CoL = '4YF8Y'; % Cat of Life
metaData.links.id_ITIS = '647901'; % ITIS
metaData.links.id_EoL = '46579978'; % Ency of Life
metaData.links.id_Wiki = 'Sparus_aurata'; % Wikipedia
metaData.links.id_ADW = 'Sparus_aurata'; % ADW
metaData.links.id_Taxo = '159658'; % Taxonomicon
metaData.links.id_WoRMS = '151523'; % WoRMS
metaData.links.id_fishbase = 'Sparus-aurata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sparus_aurata}}';
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
bibkey = 'LikaKooy2014'; type = 'Article'; bib = [ ... 
'author = {Lika, K. and Kooijman, S. A. L. M. and Papandroulakis, N.}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in {M}editerranean {P}erciformes.}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {37--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KralDulc1997'; type = 'Article'; bib = [ ... 
'author = {M. Kraljevic and J. Dulcic}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of gilt-head sea bream (\emph{Sparus aurata} {L}.) in the {M}irna {E}stuary, {N}orthern {A}driatic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {31}, ' ...
'pages = {249--255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Anon2008'; type = 'Techreport'; bib = [ ... 
'author = {Anonimus}, ' ... 
'year = {2008}, ' ...
'title = {Scientific report of {E}{F}{S}{A} prepared by Working Group on seabass/seabream welfare on Animal Welfare Aspects of Husbandry Systems for Farmed {E}uropean seabass and gilthead seabream}, ' ...
'journal = {Annex I to The EFSA Journal}, ' ...
'volume = {844}, ' ...
'pages = {1--89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Papa2013'; type = 'Misc'; bib = ...
'note = {Papandroulakis pers comm.}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

