function [data, auxData, metaData, txtData, weights] = mydata_Dynamene_bidentata

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Isopoda'; 
metaData.family     = 'Sphaeromatidae';
metaData.species    = 'Dynamene_bidentata'; 
metaData.species_en = 'Isopod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab15 = 48;   units.ab15 = 'd';   label.ab15 = 'age at birth';                      bibkey.ab15 = 'Hold1968';   
  temp.ab15 = C2K(15);  units.temp.ab15 = 'K'; label.temp.ab15 = 'temperature';
data.ab17 = 36;   units.ab17 = 'd';   label.ab17 = 'age at birth';                      bibkey.ab17 = 'Hold1968';   
  temp.ab17 = C2K(17.5);  units.temp.ab17 = 'K'; label.temp.ab17 = 'temperature';
data.tp = 117;     units.tp = 'd';     label.tp = 'time since birth at puberty';         bibkey.tp = 'Hold1968';
  temp.tp = C2K(17.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 750;    units.am = 'd';     label.am = 'life span';                           bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.14;   units.Lb  = 'cm';  label.Lb  = 'total length at birth for female';   bibkey.Lb  = 'Hold1968';
data.Lbm  = 0.14;  units.Lbm  = 'cm'; label.Lbm  = 'total length at birth for male';    bibkey.Lbm  = 'Hold1968';
data.Lp  = 0.536;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'Hold1968';
data.Lpm  = 0.607;  units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for male';  bibkey.Lpm  = 'Hold1968';
data.Li  = 0.536;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female';   bibkey.Li  = 'Hold1968';
data.Lim  = 0.607;   units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';    bibkey.Lim  = 'Hold1968';

data.Wwb = 4.2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';     bibkey.Wwb = 'Hold1968';
  comment.Wwb = 'based on egg length of 0.5 mm, width 0.4 mm: pi/6*0.05*0.04^2';
data.Wwi = 6.9e-3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on same length-weight, compared to Asellus: 0.536^3*0.045';
data.Wwim = 10.1e-3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';      bibkey.Wwim = 'guess';
  comment.Wwi = 'based on same length-weight, compared to Asellus: 0.607^3*0.045';

data.Ri  = 105/100;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'Hold1968';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '105 eggs per brood: brood interval is guessed to 2 times ab';
  
% uni-variate data
% t-L data
data.tL_f = [ ... % time at stage change (d), length (cm)
    0	0.136 % marsupial stage
   33	0.166
   46	0.202
   57	0.279
   69	0.372
   78	0.453
   84	0.536
  117	0.515];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(17.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hold1968';
comment.tL_f = 'data for females; stage changes read from 50% quantiles';
%
data.tL_m = [ ... % time at stage change (d), length (cm)
    0	0.136
   33	0.166
   46	0.202
   57	0.279
   69	0.372
   78	0.425
   84	0.527
  117	0.607];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(17.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hold1968';
comment.tL_m = 'data for males; stage changes read from 50% quantiles';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = '';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3863T'; % Cat of Life
metaData.links.id_ITIS = '544110'; % ITIS
metaData.links.id_EoL = '1022158'; % Ency of Life
metaData.links.id_Wiki = 'Dynamene'; % Wikipedia
metaData.links.id_ADW = 'Dynamene_bidentatus'; % ADW
metaData.links.id_Taxo = '3936291'; % Taxonomicon
metaData.links.id_WoRMS = '256988'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphaeromatidae}}';
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
bibkey = 'Hold1968'; type = 'Article'; bib = [ ... 
'author = {D. M. Holdich}, ' ... 
'year = {1968}, ' ...
'title = {Reproduction, growth and bionomics of \emph{Dynamene bidentata} ({C}rustacea: {I}sopoda)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {156}, ' ...
'pages = {137-153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

