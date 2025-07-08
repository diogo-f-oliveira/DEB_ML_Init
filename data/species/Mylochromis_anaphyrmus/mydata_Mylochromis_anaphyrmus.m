function [data, auxData, metaData, txtData, weights] = mydata_Mylochromis_anaphyrmus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Mylochromis_anaphyrmus'; 
metaData.species_en = 'Happy'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 11];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'TwedTurn1977'; 
data.Li  = 20.4;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 39.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','TwedTurn1977'};
  comment.Wwp = 'based on 0.01549*Lp^2.97, see F1';
data.Wwi = 120;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','TwedTurn1977'};
  comment.Wwi = 'based on 0.01549*Li^2.97, see F1';

% uni-variate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
  1.7 10.4
  2.7 14.9
  3.7 17.2];
data.tL(:,1) = 365*(0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TwedTurn1977';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
14.101	7.610
15.067	9.437
15.528	14.873
15.618	9.702
15.629	12.062
15.854	13.067
16.112	16.992
16.135	14.351
16.247	13.168
16.427	16.309
16.438	23.331
16.629	21.753
16.629	15.966
16.640	10.011
16.764	19.389
16.933	14.328
17.000	20.731
17.079	20.953
17.135	20.952
17.135	17.356
17.225	18.927
17.326	21.789
17.348	19.204
17.438	19.483
17.461	25.269
17.528	16.222
17.562	29.311
17.629	21.725
17.640	15.601
17.831	29.078
17.843	23.966
18.124	25.868
18.135	21.542
18.157	28.283
18.169	24.462
18.202	35.416
18.225	37.663
18.933	35.621];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'TwedTurn1977';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01549*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Lake Malawi'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4545N'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '206971'; % Ency of Life
metaData.links.id_Wiki = 'Mylochromis_anaphyrmus'; % Wikipedia
metaData.links.id_ADW = 'Mylochromis_anaphyrmus'; % ADW
metaData.links.id_Taxo = '475984'; % Taxonomicon
metaData.links.id_WoRMS = '1012980'; % WoRMS
metaData.links.id_fishbase = 'Mylochromis_-anaphyrmus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mylochromis_anaphyrmus}}';
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
bibkey = 'TwedTurn1977'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1977.tb04070.x }, ' ...
'author = {Tweddle, D. and J.L. Turner}, ' ...
'year  = {1977}, ' ...
'title = {Age, growth and natural mortality rates of some cichlid fishes of {L}ake {M}alawi}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {35(2)}, ' ...
'pages = {385-395}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mylochromis-anaphyrmus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

