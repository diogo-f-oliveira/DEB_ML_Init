function [data, auxData, metaData, txtData, weights] = mydata_Thalassoma_bifasciatum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Thalassoma_bifasciatum'; 
metaData.species_en = 'Bluehead wrasse'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 21];

%% set data
% zero-variate data

data.ab = 3.6;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(26.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase'; 
  temp.am = C2K(26.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 23;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Fedd1965';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 0.4;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.02, see F1';
data.Wwi = 118;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.02, see F1';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
0.216	0.913
58.645	2.262
108.514	3.375
154.115	4.421
198.283	5.399
248.137	6.445
300.792	7.355
350.582	8.130
406.033	8.871
467.136	9.544
531.067	10.184
594.982	10.755
698.637	11.562];
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(26.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fedd1965';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
3.574	798.190
4.546	1294.115
4.646	858.405
5.103	1894.404
5.386	2989.267];
units.LN = {'cm', '#'};     label.LN = {'std length','fecundity'};  
temp.LN = C2K(26.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Fedd1965';
    
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.00912*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '55ZMQ'; % Cat of Life
metaData.links.id_ITIS = '170568'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Thalassoma_bifasciatum'; % Wikipedia
metaData.links.id_ADW = 'Thalassoma_bifasciatum'; % ADW
metaData.links.id_Taxo = '46365'; % Taxonomicon
metaData.links.id_WoRMS = '159786'; % WoRMS
metaData.links.id_fishbase = 'Thalassoma-bifasciatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thalassoma_bifasciatum}}';
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
bibkey = 'Fedd1965'; type = 'article'; bib = [ ... 
'author = {Feddern, H.A.}, ' ... 
'year = {1965}, ' ...
'title = {The spawning, growth and general behavior of the bluehead wrasse \emph{Thalassoma biofasciatum} ({P}isces, {L}abridae)}, ' ...
'journal = {Bull. Mar. Sci.}, ' ...
'volume = {15(4)}, ' ...
'pages = {896-941}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Thalassoma-bifasciatum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

