function [data, auxData, metaData, txtData, weights] = mydata_Gambelia_sila
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Crotaphytidae';
metaData.species    = 'Gambelia_sila'; 
metaData.species_en = 'Blunt-nosed leopard lizard'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 61;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Wiki';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 9*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Toll1982';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 9*30.5;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'Toll1982';   
  temp.tpm = C2K(25); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.5;  units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';          bibkey.Lb  = 'Toll1982'; 
data.Lp  = 8.8;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Toll1982';  
data.Lpm  = 9.8;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'Toll1982';
  comment.Lpm = 'based on tL_m data at tpm';
data.Li  = 11.2;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Wiki';  
data.Lim  = 11.9;    units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Wiki';  

data.Wwb = 3.3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg legnth of 2.58 mm and diameter 1.56: pi/6*2.58*1.56^2';
data.Wwi = 16.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Larcerta agilis: 12*1.12^3 g';
data.Wwim = 20.2;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';       bibkey.Wwim = 'guess';
  comment.Wwim = 'based on size-corrected value for Larcerta agilis: 12*1.19^3 g';

data.Ri  = 1.2*2.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Toll1982';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 eggs per clutch, assumed: 1.2 clutches per yr';

% univariate data
% time - length 
data.tL_f = [ ... % time since birth (d), SVL (am)
0.000	4.500
57.921	8.133
237.393	9.742
354.215	10.322
419.399	10.559
606.644	10.542
787.204	10.962
973.083	10.905
1149.542	11.193];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Toll1982';
comment.tL_f = 'Data for females; max values selected';
%
data.tL_m = [ ... % time since birth (d), SVL (am)
0.000	4.581
63.742	8.709
239.792	9.751
344.511	10.926
423.430	11.299
607.069	11.317
793.742	11.692
984.969	11.622
1153.43 11.863];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Toll1982';
comment.tL_m = 'Data for males; max values selected';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3F7PW'; % Cat of Life
metaData.links.id_ITIS = '564570'; % ITIS
metaData.links.id_EoL = '794628'; % Ency of Life
metaData.links.id_Wiki = 'Gambelia_sila'; % Wikipedia
metaData.links.id_ADW = 'Gambelia_sila'; % ADW
metaData.links.id_Taxo = '389176'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gambelia&species=sila'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gambelia_sila}}';
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
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Gambelia&species=sila}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

