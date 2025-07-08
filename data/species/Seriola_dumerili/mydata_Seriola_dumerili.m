function [data, auxData, metaData, txtData, weights] = mydata_Seriola_dumerili

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Seriola_dumerili'; 
metaData.species_en = 'Greater amberjack'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2013 05 25];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Creta'};   

metaData.author_mod   = {'Bas Kooijman'};    
metaData.date_mod = [2015 08 28];              
metaData.email_mod    = {'bas.kooijman@vu.nl'};            
metaData.address_mod  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 10];


%% set data
% zero-variate data

data.ah = 1.3;    units.ah = 'd';    label.ah = 'age at hatch';             bibkey.ah = 'PapaMylo2005';   
  temp.ah = C2K(23.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 4.55;   units.ab = 'd';    label.ab = 'time at birth';             bibkey.ab = 'PapaMylo2005';   
  temp.ab = C2K(23.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3.5 * 365;    units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'fishbase';
  temp.tp = C2K(23.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'fishbase';   
  temp.am = C2K(23.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.287; units.Lh  = 'cm';  label.Lh  = 'total length at hatch';   bibkey.Lh  = 'PapaMylo2005';  
data.Lb  = 0.356; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'PapaMylo2005';  
data.Lp  = 109;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 190;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 80.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI  = 0.05;  units.GSI  = '-'; label.GSI  = 'gonado-somatic index';   bibkey.GSI  = 'Papa2013';   
temp.GSI = C2K(22); units.temp.GSI = 'K';    label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL =	[ 1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	...
      24	25	26	27	28	29	30	31	32	33	34	35	36	37	38	39	40;
        2.88	3.43	3.56	3.56	3.87	3.87	3.77	3.93	3.74	4.30	4.60	5.53...
        5.76	6.21	6.89	7.15	8.44	8.00	8.08	8.53	9.68	10.03	10.14	10.98...
        13.88	17.33	21.58	21.15	23.27	24.12	25.16	26.80	27.25	28.96	31.51	32.53	35.63	36.50	38.63	39.88]';% mm. physical length at f and T
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PapaMylo2005';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '4WV95'; % Cat of Life
metaData.links.id_ITIS = '168689'; % ITIS
metaData.links.id_EoL = '46578022'; % Ency of Life
metaData.links.id_Wiki = 'Seriola_dumerili'; % Wikipedia
metaData.links.id_ADW = 'Seriola_dumerili'; % ADW
metaData.links.id_Taxo = '45249'; % Taxonomicon
metaData.links.id_WoRMS = '126816'; % WoRMS
metaData.links.id_fishbase = 'Seriola-dumerili'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Seriola_dumerili}}';
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
bibkey = 'PapaMylo2005'; type = 'Article'; bib = [ ... 
'author = {N. Papandroulakis and C. C. Mylonas and E. Maingot and P. Divanach}, ' ... 
'year = {2005}, ' ...
'title = {First results of greater amberjack (\emph{Seriola dumerili}) larval rearing in mesocosm}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {250}, ' ...
'pages = {155-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LikaKooy2014'; type = 'Article'; bib = [ ... 
'author = {Lika, K. and Kooijman, S.A.L.M. and Papandroulakis, N.}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in {M}editerranean {P}erciformes.}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {37-46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1005}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Papa2013'; type = 'Misc'; bib = [ ...
'author = {Papandroulakis}, ' ...
'year = {2013}, ' ...
'note = { pers comm.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

