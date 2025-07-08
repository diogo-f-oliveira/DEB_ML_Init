function [data, auxData, metaData, txtData, weights] = mydata_Hybopsis_amnis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hybopsis_amnis'; 
metaData.species_en = 'Pallid shiner'; 

metaData.ecoCode.climate = {'BSk', 'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 10]; 

%% set data
% zero-variate data

data.am = 2.5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishesoftexas';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4.0;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 8.4;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';
  comment.Li = 'fishesoftexas gives TL 7 cm';  

data.Wwb = 4.6e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Cobu1986';
  comment.Wwb = 'based on egg diameter of 0.96 mm: pi/6*0.096^3';
data.Wwp = 0.62;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 6.35;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

data.Ri  = 1e3/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
  1 2.8
  2 4.3];
data.tL(:,1) = 365 * (-0.1 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3MYHL'; % Cat of Life
metaData.links.id_ITIS = '201917'; % ITIS
metaData.links.id_EoL = '356133'; % Ency of Life
metaData.links.id_Wiki = 'Hybopsis_amnis'; % Wikipedia
metaData.links.id_ADW = 'Hybopsis_amnis'; % ADW
metaData.links.id_Taxo = '415880'; % Taxonomicon
metaData.links.id_WoRMS = '1014191'; % WoRMS
metaData.links.id_fishbase = 'Hybopsis-amnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hybopsis_amnis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Hybopsis-amnis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/hybopsis amnis.htm}}';  
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
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

