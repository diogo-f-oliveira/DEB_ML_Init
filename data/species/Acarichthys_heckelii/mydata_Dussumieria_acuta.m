  function [data, auxData, metaData, txtData, weights] = mydata_Dussumieria_acuta
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dussumieriidae';
metaData.species    = 'Dussumieria_acuta'; 
metaData.species_en = 'Rainbow sardine'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSE'};
metaData.ecoCode.habitat = {'piMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 22];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Nair1991';   
  temp.am = C2K(28.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'HaleAnja2017';
  comment.Lp = '16-80 cm';
data.Li = 21.2;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'HaleAnja2017';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 39.73;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','HaleAnja2017'};
  comment.Wwp = 'based on 0.00832*Lp^2.99, see F1';
data.Wwi = 76.89;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','HaleAnja2017'};
  comment.Wwi = 'based on 0.00832*Li^2.99, see F1';

data.Ri = 34782/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'HaleAnja2017';
  temp.Ri = C2K(28.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
57.738	6.320
90.007	7.322
150.434	9.326
275.147	12.292
308.892	12.331
334.898	12.838
366.122	12.823
396.251	13.344
425.845	13.343];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Nair1991';

% length-fecundity
data.LNW = [ ... % total length (cm), fecundity (#)
    16.3 21923 44.20
    16.3 18552 42.69
    16.4 18590 43.55
    16.5 23916 46.32
    15.6 20696 36.46
    15.6 12642 35.20
    16.3 18552 42.69
    16.2 16824 39.37
    14.6 12642 35.20
    16.0 18484 32.62
    16.5 18483 36.33
    15.2 21719 36.66
    15.1 21191 32.30
    16.0 22431 48.56
    16.5 20452 51.28
    13.4 28314 43.85
    18.4 25141 63.55
    17.4 19338 55.28
    14.6 23863 38.50
    18.6 20223 47.21
    17.6 21688 36.44
    18.7 20205 41.25
    21.2 19004 72.35
    20.9 34782 77.56
    19.5 19031 60.20];
units.LNW = {'cm', '#', 'g'};  label.LNW = {'total length','fecundity','weight'};  
  temp.LNW = C2K(28.8);  units.temp.LNW = 'K'; label.temp.LNW = 'temperature'; 
  treat.LNW = {1, {'fecundity','weight'}};
bibkey.LNW = 'HaleAnja2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 3;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '384RQ'; % Cat of Life
metaData.links.id_ITIS = '161822'; % ITIS
metaData.links.id_EoL = '46562758'; % Ency of Life
metaData.links.id_Wiki = 'Dussumieria_acuta'; % Wikipedia
metaData.links.id_ADW = 'Dussumieria_acuta'; % ADW
metaData.links.id_Taxo = '173439'; % Taxonomicon
metaData.links.id_WoRMS = '126419'; % WoRMS
metaData.links.id_fishbase = 'Dussumieria-acuta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Dussumieria_acuta}}';  
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
bibkey = 'Nair1991'; type = 'Article'; bib = [ ... 
'author = {P. N. Radhakrishnan Nair}, ' ...
'year = {1991}, ' ...
'title = {THE AGE AND GROWTH RATE OF RAINBOW SARDINE \emph{Dussumieria acuta} FROM {M}ANDAPAM AREA AND ITS AGE GROUP COMPOSITION IN THE FISHERY}, ' ... 
'journal = {J. mar. biol. Ass. India}, ' ...
'volume = {33 (1,2)}, '...
'pages = {229-240}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaleAnja2017'; type = 'Article'; bib = [ ... 
'author = {K. Halesha and H. N. Anjanayappa and Mansing Naik and Jaya Naik and D. P. Rajesh and P. Nayana}, ' ...
'year = {2017}, ' ...
'title = {BREEDING BIOLOGY OF RAINBOW SARDINE, \emph{Dussumieria acuta} FROM {M}ANGALURU REGION}, ' ... 
'journal = {Biochem. Cell. Arch.}, ' ...
'volume = {17(1)}, '...
'pages = {327-331}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dussumieria-acuta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  