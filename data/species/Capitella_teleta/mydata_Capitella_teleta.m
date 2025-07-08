function [data, auxData, metaData, txtData, weights] = mydata_Capitella_teleta

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Polychaeta'; 
metaData.order      = 'Capitellida'; 
metaData.family     = 'Capitellidae';
metaData.species    = 'Capitella_teleta'; 
metaData.species_en = 'Worm'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN', 'MPNE'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiCi'};
metaData.ecoCode.gender  = {'Da'};
metaData.ecoCode.reprod  = {'Apa'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Li'}; 
metaData.data_1     = {'t-L'; 't-N'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Tjalling Jager'};    
metaData.date_subm = [2011 04 25];              
metaData.email    = {'tjalling@debtox.info'};            
metaData.address  = {'DEBtox Research, Bilthoven'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2011 06 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2015 11 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 07]; 

%% set data
% zero-variate data

data.am = 180;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mend2006';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 0.26;   units.Li  = 'cm';  label.Li  = 'ultimate volumetric length';   bibkey.Li  = 'JageSelc2011';
 
% uni-variate data

% volumetric length in mm
t = [0 14 21 25 32 39 46 53 60 66 72 78]'; % time vector of data (d)
L = [...
0.16            % volumetric length of egg
0.927746659
1.561633366
1.586425358
2.038957761
2.47560217
2.488894202
2.451991422
2.562705613
2.565819477
2.632493742
2.559584162]; % 
L = L / 10; % converte mm to cm
data.tL = [t, L];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'volumetric length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JageSelc2011';

% reproduction (# of eggs at observation times)
t = [14 21 25 32 39 46 53 60 66 72 78]'; % time (d)
N = [... % this is eggs/female in each interval
0
0
0
0
492.9199165
513.8053189
453.9914481
475.7267262
463.8866227
468.126183
387.7891116]; 
data.tN = [t, cumsum(N)]; 
units.tN  = {'d', '#'};  label.tN = {'time since birth', 'cumulative # of eggs'};  
temp.tN   = C2K(25);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'JageSelc2011';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tN([3 4]) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Facts
F1 = 'This entry is discussed in JageSelc2011';
metaData.bibkey.F1 = 'JageSelc2011'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68XKG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '11141395'; % Ency of Life
metaData.links.id_Wiki = 'Capitella_teleta'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4003905'; % Taxonomicon
metaData.links.id_WoRMS = '592089'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Capitella_teleta}}';
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
bibkey = 'HansForb1999'; type = 'Article'; bib = [ ... 
'author = {Hansen, F. T. and Forbes, V. E. and forbes, T. L.}, ' ... 
'year = {1999}, ' ...
'title = {Effects of 4-n-nonylphenol on life-history traits and population dynamics of a polychaete}, ' ...
'journal = {Ecol. Appl.}, ' ...
'volume = {9}, ' ...
'pages = {482--495}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JageSelc2011'; type = 'Article'; bib = [ ... 
'author = {Jager, T. and Selck, H.}, ' ... 
'year = {2011}, ' ...
'title = {Interpreting toxicity data in a {D}{E}{B} framework; a case study for nonylphenol in the marine polychaete \emph{Capitella teleta}}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {66}, ' ...
'pages = {456--462}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mend2006'; type = 'Article'; bib = [ ... 
'author = {N. M\''{e}ndez}, ' ... 
'year = {2006}, ' ...
'title = {Life cycle of \emph{Capitella sp.} ({P}olychaeta: {C}apitellidae) from {E}stero del {Y}ugo, {M}azatl\''{a}n, {M}exico}, ' ...
'journal = {J. Mar. Biol. Assoc. UK}, ' ...
'volume = {86}, ' ...
'pages = {263--269}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

