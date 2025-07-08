  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_catenatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_catenatus'; 
metaData.species_en = 'Northern studfish'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','piHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
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
data.am = 6*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'guess';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 3.8;  units.Lp = 'cm';     label.Lp = 'standard length at puberty'; bibkey.Lp = 'WallSimo2006'; 
  comment.Lp = 'based on same relative length, compared to F.dispar: 3.5 * 9.5/8.7';
data.Li = 9.5;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'WallSimo2006';
data.Lim = 16;     units.Lim = 'cm';     label.Lim = 'ultimate total length';  bibkey.Lim = 'WallSimo2006';

data.Wwb = 9.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'WallSimo2006';   
  comment.Wwb = 'based on egg diameter of 2.6 mm of Fundulus parvipinnis: pi/6*0.26^3';
data.Wwi = 6.2;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','WallSimo2006'};   
  comment.Wwi = 'based on 0.00603*Li^3.08, see F1';
data.Wwim = 30.8;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = {'fishbase','WallSimo2006'};   
  comment.Wwim = 'based on 0.00603*Lim^3.08, see F1';

data.Ri = 245/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data

% time-length
data.tL_f = [ ... % seasons (#), total length (cm)
1 5.4
2 6.7
3 8.4
4 9.5];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WallSimo2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % seasons (#), total length (cm)
1  5.5
2  7.0
3  8.8
4 11.3
5 16.0];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WallSimo2006';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tL_m(end)=0;

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
metaData.links.id_CoL = '6K3DL'; % Cat of Life
metaData.links.id_ITIS = '165660'; % ITIS
metaData.links.id_EoL = '211783'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_catenatus'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_catenatus'; % ADW
metaData.links.id_Taxo = '174559'; % Taxonomicon
metaData.links.id_WoRMS = '1022012'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-catenatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_catenatus}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-catenatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

