function [data, auxData, metaData, txtData, weights] = mydata_Leiostomus_xanthurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Leiostomus_xanthurus'; 
metaData.species_en = 'Spot croaker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 19];

%% set data
% zero-variate data

data.am = 5*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'ADW';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'ADW';
  comment.Lp = '18.6-21.4 cm';
data.Li  = 36;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'HildCabl1930';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 98.5;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.10, see F1';
data.Wwi = 609;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.10, see F1';

data.Ri = 1.7e6/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'mexFish';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (d), total length (cm)
  0.000	 0.946
 35.325	 2.168
 62.459	 2.799
 91.924	 4.022
123.729	 5.677
154.231	 9.581
181.268	12.025
213.115	12.892
241.396	14.154
272.041	15.416
302.657	17.190
328.560	18.767
362.807	18.925
391.125	19.516
425.346	20.147
452.523	19.989
481.969	21.566
511.500	21.566
544.663	19.910];
data.tL(:,1) = data.tL(:,1)+20; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HildCabl1930';
comment.tL = 'based on max values';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00912*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3T2K3'; % Cat of Life
metaData.links.id_ITIS = '169267'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Leiostomus_xanthurus'; % Wikipedia
metaData.links.id_ADW = 'Leiostomus_xanthurus'; % ADW
metaData.links.id_Taxo = '178316'; % Taxonomicon
metaData.links.id_WoRMS = '159322'; % WoRMS
metaData.links.id_fishbase = 'Leiostomus-xanthurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leiostomus_xanthurus}}';
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
bibkey = 'HildCabl1930'; type = 'article'; bib = [ ...  
'author = {Hildebrand, S. F. and L. E. Cable}, ' ...
'year = {1930}, ' ...
'title = {Development and life history of fourteen teleostean fishes at {B}eaufort, {N}orth {C}arolina}, ' ... 
'journal = {Bull. U.S. Bur. Fish.}, ' ...
'volume = {43}, ' ...
'pages = {383–488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Leiostomus-xanthurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Leiostomus_xanthurus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'mexFish'; type = 'Misc'; bib = ...
'howpublished = {\url{https://mexican-fish.com/spot/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

