function [data, auxData, metaData, txtData, weights] = mydata_Etrumeus_whiteheadi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dussumieriidae';
metaData.species    = 'Etrumeus_whiteheadi'; 
metaData.species_en = 'Whitehead''s round herring'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAS'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 18];

%% set data
% zero-variate data;

data.ab = 30;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';    
  temp.ab = C2K(15.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'WaldPros1991';   
  temp.am = C2K(15.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 14.5;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'RoelMelo1990';
data.Li  = 22; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.3-1.47 mm : pi/6*0.138^3';
data.Wwi = 100;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'RoelMelo1990';
  comment.Wwi = 'based on Wwi=0.00468*Li^3.11, see F1, gives 70 g';
  
% uni-variate data

% time-length
data.tL = [ % time since birth (d), standard length (cm)
    0.5	7.876
    1.5	11.999
    2.5	14.906
    3.5	16.954
    4.5	19.038];
data.tL(:,1) = (data.tL(:,1)+.8) * 365;
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(15.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WaldPros1991';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
25.421	3939.341
26.844	3296.788
29.740	2823.020
32.606	3685.441
33.858	3925.547
33.905	2851.850
34.588	4809.280
34.747	3735.718
41.228	4841.064
66.037	7566.975
70.031	6641.154
70.604	6808.866
83.177	11834.712
86.150	8951.058
88.050	12413.194
88.939	12223.365
91.297	12154.596
92.577	11010.787
94.008	12324.858
97.933	8440.170
102.373	11117.918];
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(15.6);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'RoelMelo1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 2 * weights.Li;
weights.Wwb = 2 * weights.Wwb;
weights.Wwi = 2 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00468*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6H58N'; % Cat of Life
metaData.links.id_ITIS = '551211'; % ITIS
metaData.links.id_EoL = '46562762'; % Ency of Life
metaData.links.id_Wiki = 'Etrumeus'; % Wikipedia
metaData.links.id_ADW = 'Etrumeus_whiteheadi'; % ADW
metaData.links.id_Taxo = '174197'; % Taxonomicon
metaData.links.id_WoRMS = '217441'; % WoRMS
metaData.links.id_fishbase = 'Etrumeus-whiteheadi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etrumeus}}';
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
bibkey = 'WaldPros1991'; type = 'Article'; bib = [ ...
'doi = {10.2989/02577619109504622}, ' ...
'author = {M. E. Waldron and R. M. Prosch and M. J. Armstrong}, ' ... 
'year = {1991}, ' ...
'title = {Growth of juvenile round herring \emph{Etrumeus whiteheadi} in the {B}enguela system}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {10(1)}, ' ...
'pages = {83-89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoelMelo1990'; type = 'Article'; bib = [ ...
'doi = {10.2989/025776190784378916}, ' ...
'author = {B. A. Roel and Y. C. Melo}, ' ... 
'year = {1990}, ' ...
'title = {Reproductive biology of the round herring \emph{Etrumeus whiteheadi}}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {9(1)}, ' ...
'pages = {177-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Etrumeus-whiteheadi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  
