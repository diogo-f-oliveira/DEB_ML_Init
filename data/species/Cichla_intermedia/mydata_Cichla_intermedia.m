  function [data, auxData, metaData, txtData, weights] = mydata_Cichla_intermedia
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Cichla_intermedia'; 
metaData.species_en = 'Peacock cichlid'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 16];

%% set data
% zero-variate data
data.ab = 2.5+5.6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'JepsWine1999';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'yolk sace absorption 5-6 d after hatch'; 
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'JepsWine1999';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 28;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'fishbase';
data.Li = 55;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm of Gymnogeophagus_lacustris: pi/6*0.2^3';
data.Wwp = 332.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^3.00, see F1';
data.Wwi = 2520;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^3.00, see F1';

data.Ri = 1e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.028	21.031
0.013	22.629
0.051	27.065
0.979	29.885
1.006	24.914
1.019	27.576
1.977	33.413
1.979	31.993
3.005	40.313
3.937	40.470
3.948	34.257
3.950	33.192
3.981	36.209
3.983	34.966
4.925	40.093
5.963	31.017];
data.tL(:,1) = (data.tL(:,1) + 1.5) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JepsWine1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'V7QK'; % Cat of Life
metaData.links.id_ITIS = '648357'; % ITIS
metaData.links.id_EoL = '214310'; % Ency of Life
metaData.links.id_Wiki = 'Cichla_intermedia'; % Wikipedia
metaData.links.id_ADW = 'Cichla_intermedia'; % ADW
metaData.links.id_Taxo = '171188'; % Taxonomicon
metaData.links.id_WoRMS = '1013126'; % WoRMS
metaData.links.id_fishbase = 'Cichla-intermedia'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cichla_temensis}}';  
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
bibkey = 'JepsWine1999'; type = 'Article'; bib = [ ...
'author = {D. B. Jepsen and K. O. Winemiller and D. C. Taphorn and D. Rodriguez Olarte}, ' ...
'year = {1999}, ' ...
'title = {Age structure and growth of peacock cichlids from rivers and reservoirs of {V}enezuela}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {55}, '...
'pages = {433±-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cichla-temensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

