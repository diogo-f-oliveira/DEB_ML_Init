function [data, auxData, metaData, txtData, weights] = mydata_Aglaoctenus_lagotis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Arachnida'; 
metaData.order      = 'Araneae'; 
metaData.family     = 'Lycosidae';
metaData.species    = 'Aglaoctenus_lagotis'; 
metaData.species_en = 'Wolf spider'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jTf', '0jTg', '0iTi'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Vanessa Stefani Sul-Moreira','Bas Kooijman'};    
metaData.date_subm = [2014 04 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 


%% set data
% zero-variate data

data.ab = 23;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'MoreDelC2011';   
  temp.ab = C2K(26.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 271;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MoreDelC2011';
  temp.tp = C2K(26.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 430;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'MoreDelC2011';   
  temp.am = C2K(26.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.062; units.Lb  = 'cm';  label.Lb  = 'cephalothorax length at birth';   bibkey.Lb  = 'MoreDelC2011';
data.Lp  = 0.443; units.Lp  = 'cm';  label.Lp  = 'cephalothorax length at puberty'; bibkey.Lp  = 'MoreDelC2011';
  comment.Lp = 'assumption: alloaction to reprod starts at instar 10';
data.Li  = 0.86;  units.Li  = 'cm';  label.Li  = 'ultimate cephalothorax length for female';  bibkey.Li  = 'MoreDelC2011';
data.Lim  = 0.7;  units.Lim  = 'cm'; label.Lim  = 'ultimate cephalothorax length for male';   bibkey.Lim = 'MoreDelC2011';

data.Wwb = 2.67e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MoreDelC2011';
  comment.Wwb = 'computed as 0.64 * (Lb/ 0.83)^3, since weight is 0.64 g at length 0.83 cm, More2014';
data.Wwp = 0.097;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MoreDelC2011';
  comment.Wwp = 'computed as 0.64 * (Lp/ 0.83)^3, since weight is 0.64 g at length 0.83 cm, More2014';
data.Wwi = 0.72;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MoreDelC2011';
  comment.Wwi = 'computed as 0.64 * (Li/ 0.83)^3, since weight is 0.64 g at length 0.83 cm, More2014';

data.Ri  = (237.8 + 94.125)/ 120.2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoreDelC2011';   
  temp.Ri = C2K(26.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'two sacs of eggs, first much larger than second';
  
% uni-variate data
% t-L data
data.tL = [ ... % time in instar (d), cephalothorax size (mm)
 25.27 0.62 % Instar 1
 21.45 0.97 % Instar 2 
 24.45 1.35 % Instar 3 
 24.54 1.76 % Instar 4 
 25.70 2.00 % Instar 5 
 27.00 2.47 % Instar 6 
 28.10 3.02 % Instar 7 
 29.50 3.47 % Instar 8 
 30.60 3.82 % Instar 9 
 34.58 4.43 % Instar 10 
 38.70 5.54 % Instar 11 
% 100.45 7.40 % Instar 12 (adult = f + m) 
% 80.70 6.97 % Adult (only m) 
120.20 8.60];% Adult (only f) 
data.tL(:,1) = cumsum(data.tL(:,1)); % cumulate instar times
data.tL(:,2) = data.tL(:,2)/ 10;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length cephalothorax'};  
temp.tL    = C2K(26.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoreDelC2011';
comment.tL = 'Temp varies 4.2 C';
  
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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'two clutches during last instar; If eggs sac was removed, a new one was produced with less eggs. First instar stays first 5 d in egg sac';
metaData.bibkey.F1 = 'MoreDelC2011'; 
F2 = 'The energy to make the eggs in the first sac comes from food eaten in  earlier instars. The period that spiders are adults and the weather is dry with low prey availability (June to September). In the development phase the climate is more humid with greater prey availability (October to May).';
metaData.bibkey.F2 = 'More2014'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5TRBV'; % Cat of Life
metaData.links.id_ITIS = '850088'; % ITIS
metaData.links.id_EoL = '1196373'; % Ency of Life
metaData.links.id_Wiki = 'Aglaoctenus'; % Wikipedia
metaData.links.id_ADW = 'Aglaoctenus_lagotis'; % ADW
metaData.links.id_Taxo = '727868'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_spider = '18827'; % spider

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aglaoctenus_lagotis}}';
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
bibkey = 'MoreDelC2011'; type = 'Article'; bib = [ ... 
'author = {Moreira, V. S. S. and Del-Claro, K.}, ' ... 
'year = {2011}, ' ...
'title = {Oviposition and post-embryonic development of \emph{Aglaoctenus lagotis} ({A}raneae: {L}ycosidae)}, ' ...
'howpublished = {\url{http://www.leci.ib.ufu.br/pdf/Moreira & DelClaro 2011 Zoologia.pdf}}, ' ...
'doi = {10.1590/S1984-46702011000500003}, ' ...
'journal = {ZOOLOGIA}, ' ...
'volume = {28}, ' ...
'number = {5}, '...
'pages = {565-570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'More2014'; type = 'Misc'; bib = ...
'note = {Pers comm.}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

