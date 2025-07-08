function [data, auxData, metaData, txtData, weights] = mydata_Boltenia_echinata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Stolidobranchia'; 
metaData.family     = 'Pyuridae';
metaData.species    = 'Boltenia_echinata'; 
metaData.species_en = 'Cactus sea squirt';

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MN','MAN'};
metaData.ecoCode.habitat = {'jiMb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 06 02];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 02]; 


%% set data
% zero-variate data;
data.ab = 15;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'SvanLund1982';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 0.7;  units.Lp  = 'cm';  label.Lp  = 'body length at puberty'; bibkey.Lp  = 'SvanLund1982';
data.Li  = 4.6;  units.Li  = 'cm';  label.Li  = 'ultimate body length'; bibkey.Li  = 'seawater';
  comment.Li = 'Mill1970 gives 2 cm';

data.Wwb  = 4.2e-3;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'SvanLund1982';
  comment.Wwb = 'based on diameter 2 mm: pi/6*0.2^3';
data.Wwi  = 51;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on sphere with diameter 4.6 cm: pi/6*4.6^3';

data.Ri  = 3500/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data at f

% time - length
data.tL_1973 = [ ... % time since 10 dec 1973 (10), temperature (C)
  5.5939	13.1183
114.6742	18.2554
181.8007	22.7339
257.3179	26.9489
313.2567	25.7634
380.3831	28.5296
439.1187	30.6371
506.2452	31.6909
517.4329	33.6667
590.1532	35.2473
637.7011	33.1398
665.6705	33.0081
732.7969	34.9839
853.0649	35.1156
956.5516	36.9597
1096.3983	37.3548
1300.5746	38.8038];
data.tL_1973(:,1) = data.tL_1973(:,1) - data.tL_1973(1,1); % 1/d, set start at origin
data.tL_1973(:,2) = data.tL_1973(:,2)/10; % 1/d, convert mm to cm
start.tL_1973 = 5+11*30.5; units.start.tL_1973 = 'd'; label.start.tL_1973 = 'time in year at origin';
units.tL_1973 = {'d', 'cm'}; label.tL_1973 = {'time', 'diameter', '1973 cohort'};  
bibkey.tL_1973 = 'SvanLund1982';  
comment.tL_1973 = 'sheltered locality; temperature changes seasonally';
%
data.tL_1974 = [ ... % time since 10 dec 1973 (d), temperature (C)
271.3026	7.0591
321.6475	11.8011
385.9770	17.7285
433.5248	24.1828
492.2605	27.3441
514.6360	29.1882
587.3563	30.5054
629.3103	31.5591
671.2644	30.5054
732.7969	32.3495
855.8619	36.6962
962.1454	35.2473];
data.tL_1974(:,1) = data.tL_1974(:,1) - data.tL_1974(1,1); % 1/d, set start at origin
data.tL_1974(:,2) = data.tL_1974(:,2)/10; % 1/d, convert mm to cm
units.tL_1974 = {'d', 'cm'}; label.tL_1974 = {'time', 'diameter', '1974 cohort'};  
start.tL_1974 = 8*30.5; units.start.tL_1974 = 'd'; label.start.tL_1974 = 'time in year at origin';
bibkey.tL_1974 = 'SvanLund1982';  
comment.tL_1974 = 'sheltered locality; temperature changes seasonally';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_1973 = 5 * weights.tL_1973;
weights.tL_1974 = 5 * weights.tL_1974;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
auxData.start = start;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1974','tL_1973'}; subtitle1 = {'Data for 1974, 1973 populations'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperature fluctuates seasonally as T(t) = 9+7*cos((150+t)/365*2*pi)'; 
D2 = 'it is not clear how the lengths were taken; a sphere is assumed for the the conversion to weight';
metaData.discussion = struct('D1',D1, 'D2',D2); 

%% Facts
F1 = 'Solitary tunicate';
metaData.bibkey.F1 = 'Mill1970';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WNX6'; % Cat of Life
metaData.links.id_ITIS = '159487'; % ITIS
metaData.links.id_EoL = '46584623'; % Ency of Life
metaData.links.id_Wiki = 'Boltenia_echinata'; % Wikipedia
metaData.links.id_ADW = 'Boltenia_echinata'; % ADW
metaData.links.id_Taxo = '41487'; % Taxonomicon
metaData.links.id_WoRMS = '103814'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boltenia_echinata}}'; 
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
bibkey = 'SvanLund1982'; type = 'article'; bib = [ ...
'doi = {10.1016/0077-7579(82)90022-9}, ' ...
'author = {I. Svane and T. Lund\"{a}lv}, ' ...
'doi = {10.1017/s0025315400003672}, ' ...
'year = {1982}, ' ...
'title  =  {POPULATION DYNAMICS AND REPRODUCTIVE PATTERNS OF \emph{Boltenia echinata} ({A}SCIDIACEA) ON THE {S}WEDISH WEST COAST},  ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {16)}, '...
'pages = {105-118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1970'; type = 'Book'; bib = [ ...  
'author = {Millar, R. H.}, ' ...
'year = {1970}, ' ...
'title  = {British Ascidians}, ' ...
'publisher = {Academic Press}, ' ...
'series = {Synopses of the British Fauna}, ' ...
'volume = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seawater'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seawater.no/fauna/chordata/echinata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

