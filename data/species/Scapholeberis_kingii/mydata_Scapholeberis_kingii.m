function [data, auxData, metaData, txtData, weights] = mydata_Scapholeberis_kingii
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Scapholeberis_kingii'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH','TN','TP','TA'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-R'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 15]; 

%% set data
% zero-variate data

data.ab = 1;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'MuruSiva1976';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on adult intermoult periods that vary from 1 to 1.6 d';
data.tp = 0.7;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'MuruSiva1976';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on tLR data';
data.am = 24;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MuruSiva1976';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0288; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'MuruSiva1976';
data.Lp  = 0.0400; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'MuruSiva1976';
data.Li  = 0.0920; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'MuruSiva1976';

data.Wdi  = 5.5e-6;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on length-weight of Ceriodaphnia dubia: (0.092/0.09832)^3*6.71e-06'; 
  
% uni-variate data
% time-length-reprod
data.tLR = [ ... % time since birth (h), length (mm)
    0.0 0.288   0
   24.0 0.422   0
   48.0 0.528   6.1
   72.0 0.624  16.0
   96.0 0.694  29.3
  120.0 0.734  46.2
  144.0 0.774  65.8
  168.0 0.798  86.3
  206.4 0.818 106.6
  237.6 0.840 124.1
  262.0 0.850 141.9
  286.0 0.860 161.5
  310.0 0.875 181.8
  334.0 0.887 200.8
  364.0 0.888 215.8
  397.6 0.910 230.4
  421.6 0.910 235.4
  445.6 0.920 239.4
  469.6 0.920 239.4];
data.tLR(:,1) = data.tLR(:,1)/ 24; % convert h to d
data.tLR(:,2) = data.tLR(:,2)/ 10; % convert mm to cm
units.tLR  = {'d', 'cm', '#'};  label.tLR = {'time since birth', 'length', 'cumulative # of eggs'};  
temp.tLR   = C2K(29); units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'MuruSiva1976'; treat.tLR = {1 {'length','cum reprod'}};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tLR(:,1) = 5 * weights.tLR(:,1); weights.tLR(end-5:end,2) = 0;

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
% set1 = {}; subtitle1 = {};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'ab is ignored in estimation because of inconsistency with tL data; a delay in the onset of development might be present';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = '';
metaData.bibkey.F1 = ''; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XV3J'; % Cat of Life
metaData.links.id_ITIS = '83923'; % ITIS
metaData.links.id_EoL = '51609777'; % Ency of Life
metaData.links.id_Wiki = 'Scapholeberis'; % Wikipedia
metaData.links.id_ADW = 'Scapholeberis_kingi'; % ADW
metaData.links.id_Taxo = '572821'; % Taxonomicon
metaData.links.id_WoRMS = '593150'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scapholeberis}}';
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
bibkey = 'MuruSiva1976'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00016844}, ' ...
'author = {N. Murugan and K.G. Sivaramakrishnan}, ' ... 
'year = {1976}, ' ...
'title = {Laboratory studies on the longevity, instar duration, growth, reproduction and embryonic development in \emph{Scapholeberis kingi} {S}ars (1903) ({C}ladocera: {D}aphnidae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {50(1)}, ' ...
'pages = {75–80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
