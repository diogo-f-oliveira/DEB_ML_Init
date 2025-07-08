function [data, auxData, metaData, txtData, weights] = mydata_Squatina_californica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squatiniformes'; 
metaData.family     = 'Squatinidae';
metaData.species    = 'Squatina_californica'; 
metaData.species_en = 'Pacific angelshark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 14];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data;
data.ab = 10*30.5;    units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'ADW';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp of all data are guessed';
data.ap_f = 13*365; units.ap_f = 'd';    label.ap_f = 'age at puberty (female)';  bibkey.ap_f = 'ADW'; 
  temp.ap_f = C2K(12); units.temp.ap_f = 'K'; label.temp.ap_f = 'temperature';
  comment.ap_f = 'for females';
data.ap_m = 8*365;  units.ap_m = 'd';    label.ap_m = 'age at puberty (male)';    bibkey.ap_m = 'ADW'; 
  temp.ap_m = C2K(12); units.temp.ap_m = 'K'; label.temp.ap_m = 'temperature';
  comment.ap_m = 'for males';
data.am = 35*365;   units.am = 'd';      label.am = 'life span';                  bibkey.am = 'ADW';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 25.5;      units.Lb  = 'cm';    label.Lb  = 'total length at birth';     bibkey.Lb  = 'Wiki';
data.Lp_f = 95;     units.Lp_f  = 'cm';  label.Lp_f  = 'total length at puberty (female)'; bibkey.Lp_f  = 'ADW'; 
data.Lp_m = 77.7;   units.Lp_m  = 'cm';  label.Lp_m  = 'total length at puberty (male)'; bibkey.Lp_m  = 'ADW'; 
data.Li_f  = 152;   units.Li_f  = 'cm';  label.Li_f  = 'ultimate total length (female)';   bibkey.Li_f  = 'ADW'; 
data.Li_m  = 118;   units.Li_m  = 'cm';  label.Li_m  = 'ultimate total length (male)';   bibkey.Li_m  = 'ADW'; 

data.Wwi_f = 27000; units.Wwi_f = 'g';   label.Wwi_f = 'ultimate wet weight';     bibkey.Wwi_f = 'ADW'; 
  comment.Wwi_f = 'for females';

data.Ri  = 6/365;units.Ri  = '#/d';      label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 - 10 eggs/yr';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 10 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'depth 3 - 100 m (till 185 m), burried in mud during day';
metaData.bibkey.F1 = 'ADW';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'ADW';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6ZFFB'; % Cat of Life
metaData.links.id_ITIS = '160785'; % ITIS
metaData.links.id_EoL = '46560329'; % Ency of Life
metaData.links.id_Wiki = 'Squatina_californica'; % Wikipedia
metaData.links.id_ADW = 'Squatina_californica'; % ADW
metaData.links.id_Taxo = '106304'; % Taxonomicon
metaData.links.id_WoRMS = '271667'; % WoRMS
metaData.links.id_fishbase = 'Squatina-californica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squatina_californica}}'; 
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Squatina_californica}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Squatina_californica/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

