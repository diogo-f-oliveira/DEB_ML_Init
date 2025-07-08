function [data, auxData, metaData, txtData, weights] = mydata_Ctenopharynx_intermedius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Ctenopharynx_intermedius'; 
metaData.species_en = 'Blackspot climbing perch'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
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
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 21.0;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 23e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Smit2000';
  comment.Wwb = 'based on Copadichromis chrysonotus egg length of 4.3 mm and presumed width 0f 3.2 mm: pi/6*0.43*0.32^2';
data.Wwp = 37.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^2.93, see F1';
data.Wwi = 92;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.93, see F1';

% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
348.702	5.393
365+13.296	5.972
365+44.355	6.864
365+104.169	7.443
365+134.686	7.398
365+163.395	7.933
365+318.445	11.409
365+348.923	12.078
730+44.934	12.435
730+134.392	12.702
730+194.810	13.058];
data.tL(:,1) = data.tL(:,1) - 180; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
14.670	139.851
14.895	111.722
15.346	120.871
15.540	130.583
15.916	139.738
16.121	168.909
16.227	149.981
17.237	182.863
18.097	222.245
18.235	171.421
18.366	217.896
18.667	240.031
18.922	162.170];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
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
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^2.93'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-fecundity: N in # = 7.598*(TL in cm)^2.075'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '326B6'; % Cat of Life
metaData.links.id_ITIS = '649079'; % ITIS
metaData.links.id_EoL = '994764'; % Ency of Life
metaData.links.id_Wiki = 'Ctenopharynx_intermedius'; % Wikipedia
metaData.links.id_ADW = 'Ctenopharynx_intermedius'; % ADW
metaData.links.id_Taxo = '45608'; % Taxonomicon
metaData.links.id_WoRMS = '1021066'; % WoRMS
metaData.links.id_fishbase = 'Ctenopharynx-intermedius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ctenopharynx_intermedius}}';
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
bibkey = 'Smit2000'; type = 'Article'; bib = [ ...    
'author = {Lance W. Smith}, ' ...
'year  = {2000}, ' ...
'title = {The reproductive biology of an open-water spawning {L}ake {M}alawi cichlid, \emph{Copadichromis chrysonotus}}, ' ...  
'journal = {African Zoology}, ' ...
'volume = {35(2)}, ' ...
'pages = {151–164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TwedTurn1977'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1977.tb04070.x }, ' ...
'author = {Tweddle, D. and J.L. Turner}, ' ...
'year  = {1977}, ' ...
'title = {Age, growth and natural mortality rates of some cichlid fishes of {L}ake {M}alawi}, ' ...  
'journal = {10(4)}, ' ...
'volume = {35(2)}, ' ...
'pages = {385-395}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ctenopharynx-intermedius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

