function [data, auxData, metaData, txtData, weights] = mydata_Lethrinops_parvidens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Lethrinops_parvidens'; 
metaData.species_en = 'Lethrinops red flush'; 

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
metaData.date_subm = [2024 10 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 10];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'TwedTurn1977'; 
data.Li  = 18.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'TwedTurn1977';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 43;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','TwedTurn1977'};
  comment.Wwp = 'based on 0.01380*Lp^2.97, see F1';
data.Wwi = 80;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','TwedTurn1977'};
  comment.Wwi = 'based on 0.01380*Li^2.97, see F1';

% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
349.320	7.307
365+14.873	8.059
365+45.390	9.938
365+105.882	10.551
365+135.470	11.302
365+195.971	11.618
365+287.374	11.855
365+349.441	13.539
730+15.311	14.469
730+45.542	15.220
730+104.762	15.357
730+134.691	15.514
730+165.911	15.555
730+196.157	15.832
730+287.264	15.297
730+319.110	15.873
730+349.003	17.158];
data.tL(:,1) = data.tL(:,1) - 70; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
13.914	89.604
14.948	100.495
15.024	87.129
15.107	66.832
15.217	114.851
15.408	92.079
15.419	99.505
15.453	75.248
15.499	103.465
15.536	95.049
15.622	85.149
15.625	98.020
15.643	91.584
15.650	120.792
15.790	88.614
15.809	127.228
15.837	118.812
15.903	108.416
16.028	99.505
16.145	134.653
16.281	90.594
16.348	122.277
16.605	128.713
16.880	128.713
17.118	97.030
17.146	131.683
17.275	139.109];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'TwedTurn1977';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'length-weight: Ww in g = 0.01380*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Lake Malawi.'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PQNJ'; % Cat of Life
metaData.links.id_ITIS = '649514'; % ITIS
metaData.links.id_EoL = '207824'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinops_parvidens'; % Wikipedia
metaData.links.id_ADW = 'Lethrinops_parvidens'; % ADW
metaData.links.id_Taxo = '178727'; % Taxonomicon
metaData.links.id_WoRMS = '1015774'; % WoRMS
metaData.links.id_fishbase = 'Lethrinops-parvidens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinops_parvidenstus}}';
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
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
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
'howpublished = {\url{https://www.fishbase.se/summary/Lethrinops-parvidens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

