function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_puncticeps
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_puncticeps'; 
metaData.species_en = 'Speckled tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 06];

%% set data
% zero-variate data
data.ab = 2.9;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'guess';
data.Li = 35;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 9.2e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Raja1992';
  comment.Wwb = 'based on egg diameter of 0.56 mm: pi/6*0.056^3';
data.Wwp = 47;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwp = 'based on 0.00468*Li^3.13, see F1';
data.Wwi = 319; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00468*Li^3.13, see F1';

data.Ri = 1e5/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cynoglossus_arel';

% uni-variate data
% time-length        
data.tL = [ ... % age (yrs), total length (cm) 
188.200	7.594
240.068	9.060
272.567	9.587
305.856	10.529
332.946	11.158
365.457	11.997];
data.tL(:,1) = 40+data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'InglPaul1984'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00468*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BTZ8'; % Cat of Life
metaData.links.id_ITIS = '173093'; % ITIS
metaData.links.id_EoL = '46570068'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus_puncticeps'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_puncticeps'; % ADW
metaData.links.id_Taxo = '172576'; % Taxonomicon
metaData.links.id_WoRMS = '274220'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-puncticeps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus_puncticeps}}';
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
'author = {Ingles, J. and D. Pauly}, ' ... 
'year = {1984}, ' ...
'title = {An atlas of the growth, mortality and recruitment of {P}hilippines fishes}, ' ...
'institution = {ICLARM, International Center for Living Aquatic Resources Management, Manila, Philippines}, ' ...
'volume = {Tech. Rep. 13.}, '...
'pages = {127 p.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-puncticeps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
