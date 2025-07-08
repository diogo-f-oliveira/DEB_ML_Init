function [data, auxData, metaData, txtData, weights] = mydata_Rhynchorhamphus_georgii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Rhynchorhamphus_georgii'; 
metaData.species_en = 'Long billed half beak'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 01];

%% set data
% zero-variate data

data.am = 5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15.8;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 31;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 8.2;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00245*Lp^2.94, see F1';
data.Wwi = 59.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00245*Li^2.94, see F1';

data.Ri = 1e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95, reflecting reported low fecundity';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), total length (cm)
346.559	15.477
365+191.251	20.603
365+224.800	21.860
365+255.988	22.737
365+283.269	23.361
365+316.775	23.984];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'InglPaul1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'wet weight (g) = 0.00245*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYDR'; % Cat of Life
metaData.links.id_ITIS = '165484'; % ITIS
metaData.links.id_EoL = '46567009'; % Ency of Life
metaData.links.id_Wiki = 'Rhynchorhamphus_georgii'; % Wikipedia
metaData.links.id_ADW = 'Rhynchorhamphus_georgii'; % ADW
metaData.links.id_Taxo = '177171'; % Taxonomicon
metaData.links.id_WoRMS = '272179'; % WoRMS
metaData.links.id_fishbase = 'Rhynchorhamphus-georgii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus}}'];
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
bibkey = 'InglPaul1984'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://worldfishcenter.org/publication/atlas-growth-mortality-and-recruitment-philippine-fishes}}, ' ...
'author = {Ingles, J. and D. Pauly}, ' ... 
'year = {1984}, ' ...
'title = {An atlas of the growth, mortality and recruitment of {P}hilippines fishes. ICLARM Tech.}, ' ...
'institution = {International Center for Living Aquatic Resources Management, Manila, Philippines}, ', ...
'volume = {13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Rhynchorhamphus-georgii.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

