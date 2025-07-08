  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_dispar
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_dispar'; 
metaData.species_en = 'Northern starhead topminnow'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','piHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 06 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data
data.tp = 2*365;        units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'WallSimo2006';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'guess';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lb = 0.67;     units.Lb = 'cm';     label.Lb = 'standard length at birth'; bibkey.Lb = 'WallSimo2006'; 
  comment.Lb = 'TL 6.4 to 7 mm';
data.Lp = 2.8/0.8;  units.Lp = 'cm';     label.Lp = 'standard length at puberty'; bibkey.Lp = 'WallSimo2006'; 
  comment.Lp = 'based on SL 2.8 cm  and SL = 0.8 TL';
data.Li = 8.7;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'WallSimo2006';
  comment.Li = 'based on 7.4/7.8*Lim';
data.Lim = 9.2;     units.Lim = 'cm';     label.Lim = 'ultimate total length';  bibkey.Lim = 'WallSimo2006';

data.Wwb = 3.1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'WallSimo2006';   
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwi = 4.7;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','WallSimo2006'};   
  comment.Wwi = 'based on 0.00603*Li^3.08, see F1';
data.Wwim = 5.6;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = {'fishbase','WallSimo2006'};   
  comment.Wwim = 'based on 0.00603*Lim^3.08, see F1';

data.RL = 136/365;  units.RL = '#/d';  label.RL = 'reprod rate at TL 5 cm';  bibkey.RL = 'WallSimo2006';   
  temp.RL = C2K(20); units.temp.RL = 'K'; label.temp.RL = 'temperature';
    
% uni-variate data

data.tL_f = [ ... % seasons (#), total length (cm)
1 3.4
2 5.3
3 7.4];
data.tL_f(:,1) = 365 * (0.4 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WallSimo2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % seasons (#), total length (cm)
1 3.5
2 5.6
3 7.8];
data.tL_m(:,1) = 365 * (0.4 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WallSimo2006';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
F1 = 'length-weight: Ww in g = 0.00603 *(TL in cm)^3.08'; 	
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6JRFG'; % Cat of Life
metaData.links.id_ITIS = '165672'; % ITIS
metaData.links.id_EoL = '211391'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_dispar'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_dispar'; % ADW
metaData.links.id_Taxo = '174564'; % Taxonomicon
metaData.links.id_WoRMS = '1021616'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-dispar'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_dispar}}';
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
bibkey = 'WallSimo2006'; type = 'Book'; bib = [ ...  
'author = {Robert Wallus and Thomas P. Simon}, ' ...
'year = {2026}, ' ...
'title  = {Reproductive Biology and Early Life History of Fishes in the Ohio River Drainage}, ' ...
'publisher = {Taylor and Francis, Boca Raton}, ' ...
'volume = {5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-dispar.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

