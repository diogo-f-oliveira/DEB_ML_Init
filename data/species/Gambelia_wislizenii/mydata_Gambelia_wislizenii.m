function [data, auxData, metaData, txtData, weights] = mydata_Gambelia_wislizenii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Crotaphytidae';
metaData.species    = 'Gambelia_wislizenii'; 
metaData.species_en = 'Long-nosed leopard lizard'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 15];

%% set data
% zero-variate data

data.tp = 20.5*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Toll1982';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 20.5*30.5;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'Toll1982';   
  temp.tpm = C2K(25); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.5;  units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';          bibkey.Lb  = 'Toll1982'; 
data.Lp  = 9.1;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Toll1982';  
data.Lpm  = 9.0;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'Toll1982';  
data.Li  = 11.15;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Toll1982';  
data.Lim  = 10.45;    units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Toll1982';  

data.Wwb = 2.9;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Toll1982';
  comment.Wwb = 'based on egg length of 2.3 cm and diameter 1.56 cm: pi/6*2.3*1.56^2';
data.Wwi = 18.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Larcerta agilis: 12*1.15^3 g';
data.Wwim = 13.7;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';       bibkey.Wwim = 'gues';
  comment.Wwim = 'based on size-corrected value for Larcerta agilis: 12*1.045^3 g';

data.Ri  = 1.2*5.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Toll1982';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.6 eggs per clutch, assumed: 1.2 clutches per yr';


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
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'reptile-database says that this species is viviparous, but that is not true';
metaData.bibkey.F1 = 'reptileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F7PZ'; % Cat of Life
metaData.links.id_ITIS = '173924'; % ITIS
metaData.links.id_EoL = '794585'; % Ency of Life
metaData.links.id_Wiki = 'Gambelia_wislizenii'; % Wikipedia
metaData.links.id_ADW = 'Gambelia_wislizenii'; % ADW
metaData.links.id_Taxo = '389179'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gambelia&species=wislizenii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gambelia_wislizenii}}';
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
bibkey = 'Toll1982'; type = 'Article'; bib = [ ... 
'author = {Kristine Tollestrup}, ' ... 
'year = {1982}, ' ...
'title = {Growth and Reproduction in Two Closely Related Species of Leopard Lizards, Gambelia silus and Gambelia wislizenii}, ' ...
'pages = {1-20}, ' ...
'volume = {108}, ' ...
'journal = {The American Midland Naturalist}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Gambelia&species=wislizenii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

