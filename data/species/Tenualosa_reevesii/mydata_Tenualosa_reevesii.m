  function [data, auxData, metaData, txtData, weights] = mydata_Tenualosa_reevesii
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Tenualosa_reevesii'; 
metaData.species_en = 'Reeves shad'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMpe', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 02];

%% set data
% zero-variate data
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 46;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
  comment.Lp = '44-51 cm';
data.Li = 61.6;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Tenualosa ilisha: pi/6*0.07^3';
data.Wwp = 1.3e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01122*Lp^3.04, see F1';
data.Wwi = 3.1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1; max published weight 5 kg';
  
data.Ri = 4.3e6/365;units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (yr), weight (g)
1	70.378
2	378.846
3	725.785
4	1065.014
5	1361.927
6	1555.011];
data.tW(:,1) = data.tW(:,1) * 365;
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'WangXion2007';
comment.tW = 'captive individuals';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7BQFJ'; % Cat of Life
metaData.links.id_ITIS = '551299'; % ITIS
metaData.links.id_EoL = '46562487'; % Ency of Life
metaData.links.id_Wiki = 'Tenualosa_reevesii'; % Wikipedia
metaData.links.id_ADW = 'Tenualosa_reevesii'; % ADW
metaData.links.id_Taxo = '188876'; % Taxonomicon
metaData.links.id_WoRMS = '278570'; % WoRMS
metaData.links.id_fishbase = 'Tenualosa-reevesii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Tenualosa_reevesii}}';  
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
bibkey = 'WangXion2007'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1749-7345.2003.tb00069.x}, ' ...
'author = {Han-Ping Wang and Bang-Xi Xiong and Kai-Jing Wei and Hong Yao}, ' ... 
'year = {2007}, ' ...
'title = {Broodstock Rearing and Controlled Reproduction of {R}eeves Shad \emph{Tenualosa reevesii}}, ' ...
'journal = {Journal of the World Aquaculture Society}, ' ...
'volume = {34(3)}, ' ...
'pages = {245-422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Tenualosa-reevesii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
