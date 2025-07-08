  function [data, auxData, metaData, txtData, weights] = mydata_Hypophthalmus_edentatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Hypophthalmus_edentatus'; 
metaData.species_en = 'Highwaterman catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 30];

%% set data
% zero-variate data
data.ab = 8.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Astyanax_mexicanus';

data.Lp = 25.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 57.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 149;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00603*Lp^3.12, see F1';
data.Wwi = 1.3e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published value, based on 0.00603*Li^3.12 gives 1.86 kg, see F1';

data.Ri = 1e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    0 15.6 17.5
    1 23.5 22.3
    2 29.1 30.1
    2 33.8 32.3
    3 36.4 34.0
    3 36.0 36.0
    4 42.6 37.9
    4 38.3 NaN
    5 43.7 37.5];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.75) * 365; % convert yr to d
for i=2:size(data.tL_fm,1); if data.tL_fm(i,1)<=data.tL_fm(i-1,1); data.tL_fm(i,1)=data.tL_fm(i-1,1)+1e-3;end;end
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'AmbrGome2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6N35M'; % Cat of Life
metaData.links.id_ITIS = '164260'; % ITIS
metaData.links.id_EoL = '46581883'; % Ency of Life
metaData.links.id_Wiki = 'Hypophthalmus_edentatus'; % Wikipedia
metaData.links.id_ADW = 'Hypophthalmus_edentatus'; % ADW
metaData.links.id_Taxo = '153062'; % Taxonomicon
metaData.links.id_WoRMS = '281103'; % WoRMS
metaData.links.id_fishbase = 'Hypophthalmus-edentatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hypophthalmus_edentatus}}';  
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
bibkey = 'AmbrGome2003'; type = 'Article'; bib = [ ...
'author = {Angela Maria Ambr\''{o}sio and Luiz Carlos Gomes and Angelo Ant\^{o}nio Agostinho}, ' ...
'year = {2003}, ' ...
'title = {Age and growth of \emph{Hypophthalmus edentatus} ({S}pix), ({S}iluriformes, {H}ypophthalmidae) in the {I}taipu Reservoir, {P}aran\''{a}, {B}razil}, ' ... 
'journal = {Revista Brasileira de Zoologia}, ' ...AmbrGome2003
'volume = {20(2)}, '...
'pages = {183–190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hypophthalmus-edentatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

