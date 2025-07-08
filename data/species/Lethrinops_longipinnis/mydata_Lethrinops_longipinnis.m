function [data, auxData, metaData, txtData, weights] = mydata_Lethrinops_longipinnis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Lethrinops_longipinnis'; 
metaData.species_en = 'Longfin lethrinops'; 

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
  
data.Lp  = 14.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'TwedTurn1977'; 
data.Li  = 22.6;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'TwedTurn1977';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 59.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','TwedTurn1977'};
  comment.Wwp = 'based on 0.01905*Lp^3.01, see F1';
data.Wwi = 226.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','TwedTurn1977'};
  comment.Wwi = 'based on 0.01905*Li^3.01, see F1';

% uni-variate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
    1  9.4
    2 14.2
    3 16.4
    4 18.3];
data.tL(:,1) = 365*(0.1 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TwedTurn1977';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
14.549	52.258
15.277	103.134
15.369	91.284
15.551	114.929
15.571	87.156
15.754	79.845
15.763	83.940
15.945	108.040
15.973	90.282
15.980	126.244
16.035	118.042
16.072	123.499
16.081	126.684
16.091	99.824
16.110	90.261
16.170	158.992
16.172	130.312
16.175	85.699
16.181	136.229
16.229	100.713
16.272	144.409
16.273	128.931
16.283	107.534
16.302	90.232
16.329	108.437
16.346	129.831
16.366	98.872
16.391	133.010
16.393	110.704
16.418	141.656
16.438	115.704
16.456	119.344
16.484	115.697
16.521	108.408
16.563	162.575
16.591	157.563
16.610	144.813
16.648	129.330
16.666	133.424
16.784	137.958
16.856	153.881
16.892	167.988
16.903	134.754
16.914	117.908
17.050	125.171
17.168	147.460
17.308	91.900
17.333	139.241
17.341	156.994
17.370	128.310
17.460	161.073
17.478	153.786
17.489	136.486
17.489	128.747
17.516	132.384
17.671	143.287
17.688	168.322
17.854	148.267
18.254	186.901
18.313	108.591
19.087	168.110
19.196	179.474
19.499	168.047
19.591	151.189
19.863	188.477
19.973	193.924
20.077	140.645
20.263	242.135
20.393	198.867
20.613	198.834
20.694	225.226];
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
F1 = 'length-weight: Ww in g = 0.01905*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Lake Malawi.'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PQNP'; % Cat of Life
metaData.links.id_ITIS = '649503'; % ITIS
metaData.links.id_EoL = '207728'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinops_longipinnis'; % Wikipedia
metaData.links.id_ADW = 'Lethrinops_longipinnis'; % ADW
metaData.links.id_Taxo = '178715'; % Taxonomicon
metaData.links.id_WoRMS = '1012585'; % WoRMS
metaData.links.id_fishbase = 'Lethrinops_longipinnis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinops_longipinnis}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Lethrinops-longipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

