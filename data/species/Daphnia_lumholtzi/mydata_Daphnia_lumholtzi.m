function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_lumholtzi
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_lumholtzi'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TA','TPi','TA'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-N'; 'T-ab'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 13]; 

%% set data
% zero-variate data

data.tp = 6.25;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'SharShar1984';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 42;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SharShar1984';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.05621; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'SharShar1984';
data.Lp  = 0.100; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'SharShar1984';
data.Li  = 0.1759;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'SharShar1984';

data.Wdi  = 34.8;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Ceriodaphnia_pulchella: (0.1759/0.09)^3*4.668';
  
% uni-variate data
% time-length-reprod
data.tLR = [ ... % time since birth (h), length (mm), 
     0.000 0.562  0
    40.376 0.702  0
    85.303 0.872  0
   131.523 0.981  0
   179.128 1.121  1.672
   237.030 1.247  4.589
   302.447 1.315  7.777
   369.737 1.480 10.970
   438.308 1.539 14.200
   508.868 1.594 17.382
   597.685 1.662 19.782
   651.005 1.711 21.841
   737.035 1.720 23.257
   795.500 1.734 24.257
   867.430 1.759 NaN
   939.430 1.759 NaN];
data.tLR(:,1) = data.tLR(:,1)/24; % convert h to d
data.tLR(:,2) = data.tLR(:,2)/10; % convert mm to cm
units.tLR  = {'d', 'cm', '#'};  label.tLR = {'time since birth', 'length', 'cum # of eggs'};  
temp.tLR   = C2K(15); units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'SharShar1984'; treat.tLR = {1 {'length','reprod'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLR(:,1) = 3 * weights.tLR(:,1);
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'ab is ignored in estimation because of inconsistency with tL data; a delay in the onset of development might be present';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '345BV'; % Cat of Life
metaData.links.id_ITIS = '684652'; % ITIS
metaData.links.id_EoL = '1041339'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia_lumholtzi'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_lumholtzi'; % ADW
metaData.links.id_Taxo = '788244'; % Taxonomicon
metaData.links.id_WoRMS = '1302534'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharShar1984'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3544724}, ' ...
'author = {Sumita Sharma and Sharma, B. K. and Michael, R. G.}, ' ... 
'year = {1984}, ' ...
'title = {Laboratory studies on the longevity, instar duration, egg production and growth of \emph{Daphnia lumholtzi} {S}ars ({C}ladocera: Daphnidae)}, ' ...
'journal = {Proc. Nat. Acad. Sci. India}, ' ...
'volume = {54(B)}, ' ...
'pages = {306-314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
