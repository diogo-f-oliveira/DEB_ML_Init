function [data, auxData, metaData, txtData, weights] = mydata_Acrocheilus_alutaceus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Acrocheilus_alutaceus'; 
metaData.species_en = 'Chiselmouth'; 

metaData.ecoCode.climate = {'Dsb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 17]; 

%% set data
% zero-variate data
data.ab12 = 16;   units.ab12 = 'd';  label.ab12 = 'age at birth';               bibkey.ab12 = 'MoodLind1972';   
  temp.ab12 = C2K(12); units.temp.ab12 = 'K'; label.temp.ab12 = 'temperature'; 
data.ab18 = 6;   units.ab18 = 'd';  label.ab18 = 'age at birth';                bibkey.ab18 = 'MoodLind1972';   
  temp.ab18 = C2K(18); units.temp.ab18 = 'K'; label.temp.ab18 = 'temperature'; 
data.tp = 3*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';   bibkey.tp= 'fishbase';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am= 'MoodLind1972';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 14;    units.Lp = 'cm'; label.Lp = 'total length at puberty';         bibkey.Lp = {'fishbase','MoodLind1972'};
  comment.Lp = 'based on tp=3 yr and tL data';
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'Wiki'; 
  
data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm from G. bicolor, now called Siphateles bicolor : pi/6*0.13^3';
data.Wwp = 31.4;   units.Wwp = 'g';  label.Wwp = 'wet weight puberty';         bibkey.Wwp = 'MoodLind1972';
  comment.Wwp = 'based on 0.00813*Lp^3.13, F1';
data.Wwi = 341.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weigh';         bibkey.Wwi = 'MoodLind1972';
  comment.Wwi = 'based on 0.00813*Li^3.13, F1';
  
data.Ri = 6200/365; units.Ri = '#/d';  label.Ri = 'ultimate reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
     
% % univariate data
 
% time-length
data.tL = [ ... % days post hatch, total length (cm)
1	4.942
2	10.512
3	14.378
4	20.710
5	22.871
6	23.103];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoodLind1972'; 
comment.tL = 'Data from Okanogan River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1', F1); 

%% Links
metaData.links.id_CoL = '9LQC'; % Cat of Life
metaData.links.id_ITIS = '163531'; % ITIS
metaData.links.id_EoL = '223766'; % Ency of Life
metaData.links.id_Wiki = 'Acrocheilus_alutaceus'; % Wikipedia
metaData.links.id_ADW = 'Acrocheilus_alutaceus'; % ADW
metaData.links.id_Taxo = '160102'; % Taxonomicon
metaData.links.id_WoRMS = '592842'; % WoRMS
metaData.links.id_fishbase = 'Acrocheilus-alutaceus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acrocheilus_alutaceus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Acrocheilus-alutaceus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MoodLind1972'; type = 'article'; bib = [ ... 
'author = {G. E. E. Moodie and C. C. Lindsey}, ' ...
'year = {1972}, ' ...
'title  = {Life-history of a unique cyprinid fish, the chiselmouth (\emph{Acrocheilus alutaceus}), in {B}ritish {C}olumbia}, ' ...
'journal = {Syesis}, ' ...
'pages = {55-61}, ' ...
'volume = {5}'];
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
