function [data, auxData, metaData, txtData, weights] = mydata_Dendrophysa_russelii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Dendrophysa_russelii'; 
metaData.species_en = 'Goatee croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 05];

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(28.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.3);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 38.3;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LikaKooy2014';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 5e3; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00813*Lp^3.10, see F1';
data.Wwi = 103e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.10, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(28.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Argyrosomus regius';
 
% uni-variate data
% time-length
data.tL = [ ... % time (d), total length (cm)
263.915	8.704
280.558	9.118
330.483	10.410
354.700	10.775
568.131	13.545
583.269	13.703];
data.tL(:,1) = data.tL(:,1) + 220; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'InglPaul1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f22','tL_f21'}; subtitle1 = {'mesocosm'};
% set2 = {'tWw_15_1', 'tWw_15_2', 'tWw_15_3', 'tWw_15_4'}; subtitle2 = {'HCMR cages 1,2,3 and 4 at varying temperatures (year 2015)'};
% set3 = {'tWw_13_1', 'tWw_13_2'}; subtitle3 = {'HCMR cages 1 and 2 at varying temperatures (year 2013)'};
% metaData.grp.sets = {set1,set2,set3};
% metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00813*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34RZY'; % Cat of Life
metaData.links.id_ITIS = '646559'; % ITIS
metaData.links.id_EoL = '46579132'; % Ency of Life
metaData.links.id_Wiki = 'Dendrophysa_russelii'; % Wikipedia
metaData.links.id_ADW = 'Dendrophysa_russelii'; % ADW
metaData.links.id_Taxo = '172975'; % Taxonomicon
metaData.links.id_WoRMS = '280499'; % WoRMS
metaData.links.id_fishbase = 'Dendrophysa-russelii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendrophysa_russelii}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Dendrophysa-russelii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

