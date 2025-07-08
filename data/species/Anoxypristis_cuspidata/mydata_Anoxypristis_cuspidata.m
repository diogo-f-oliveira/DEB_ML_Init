function [data, auxData, metaData, txtData, weights] = mydata_Anoxypristis_cuspidata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Pristidae';
metaData.species    = 'Anoxypristis_cuspidata'; 
metaData.species_en = 'Knifetooth sawfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMcd','0iMm','0iFe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 04];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 25];                           
metaData.emailmod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 25];

%% set data
% zero-variate data;
data.ab = 5*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';    
  temp.ab = C2K(28.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Pristis microdon';
data.am = 27*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(28.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 52;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki';
 comment.Lb = '43-61 cm';
data.Lp  = 203;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'sawfish'; 
data.Lpm  = 225;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'sawfish'; 
data.Li  = 470;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 707.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.05, see F1';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'sawfish';   
  temp.Ri = C2K(28.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-16 pups per litter; assumed 1 litter per 1 yr';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
    0 mean([83 115])
    1 mean([118 164])
    2 mean([182 247])
    3 mean([227 302])
    4 mean([298 300])
    5 mean([316 338])
    9 389];
data.tL(:,1) = (0.4 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(28.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'sawfish';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'mod_1: predicted age at birth is much larger than "observed"';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00501 * (TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Tolerates low salinity levels and is also found in inshore waters, including bays and estuaries';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Ovoviviparous';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '66XW7'; % Cat of Life
metaData.links.id_ITIS = '564306'; % ITIS
metaData.links.id_EoL = '46560367'; % Ency of Life
metaData.links.id_Wiki = 'Anoxypristis_cuspidata'; % Wikipedia
metaData.links.id_ADW = 'Anoxypristis_cuspidata'; % ADW
metaData.links.id_Taxo = '161015'; % Taxonomicon
metaData.links.id_WoRMS = '217374'; % WoRMS
metaData.links.id_fishbase = 'Anoxypristis-cuspidata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anoxypristis_cuspidata}}'; 
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anoxypristis-cuspidata.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sawfish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://sawfishconservationsociety.org/anoxypristis.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 