function [data, auxData, metaData, txtData, weights] = mydata_Homarus_americanus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Nephropidae';
metaData.species    = 'Homarus_americanus'; 
metaData.species_en = 'American lobster'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj', 'ap', 'am', 'Lj', 'Lp', 'Li', 'L_t', 'Wwj', 'Wwp', 'Wwi', 'Ww_t', 'R_L', 'E0'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 08 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 31]; 

%% set data
% zero-variate data

data.tj = 90;  units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'Wiki';   
  temp.tj = C2K(10); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ADW';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 60*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 1.3;   units.Lj  = 'cm';  label.Lj  = 'total length at settle';      bibkey.Lj  = 'Wiki';
data.Lp  = 17.7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';       bibkey.Lp  = 'ADW';
  comment.Lp = 'at 18 cm, the fecundity is 3e3 eggs';
data.LpC  = 8.1;  units.LpC  = 'cm';  label.LpC  = 'carapace length at puberty'; bibkey.LpC  = 'Krou1973';
data.LpmC  = 4.4;  units.LpmC  = 'cm';  label.LpmC  = 'carapace length at puberty'; bibkey.LpmC  = 'Krou1973';
data.Li  = 110;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'EoL';
data.L1 = 3.1;    units.L1  = 'cm';  label.L1  = 'total length at 1yr';         bibkey.L1  = 'Wiki';
  temp.L1 = C2K(10); units.temp.L1 = 'K'; label.temp.L1 = 'temperature';
  comment.L1 = '25 till 38 mm';

data.Wwj = 0.0746;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';       bibkey.Wwj = 'guess';
  comment.Wwj = 'Computed as (Lj/ Lp)^3 * Wwp';
data.Wwp = 413;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'Krou1973';
  comment.Wwp = 'basied on LpC, using F3';
data.Wwpm = 70.4;    units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'Krou1973';
  comment.Wwpm = 'basied on LpmC, using F3';
data.Wwi = 20e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'EoL';
data.Ww6 = 450;    units.Ww6  = 'g';  label.Ww6  = 'wet weight at 6yr';         bibkey.Ww6  = 'Wiki';
  temp.Ww6 = C2K(10); units.temp.Ww6 = 'K'; label.temp.Ww6 = 'temperature'; 

data.R18  = 3e3/365;  units.R18  = '#/d'; label.R18  = 'reprod rate at TL 18 cm';  bibkey.R18  = 'ADW';   
  temp.R18 = C2K(10);  units.temp.R18 = 'K'; label.temp.R18 = 'temperature';
data.R45  = 75e3/365; units.R45  = '#/d'; label.R45  = 'reprod rate at TL 45 cm';  bibkey.R45  = 'ADW';   
  temp.R45 = C2K(10);  units.temp.R45 = 'K'; label.temp.R45 = 'temperature';

data.E0 = 21; units.E0 = 'J';   label.E0 = 'egg energy content';       bibkey.E0 = 'AttaHudo1987';
  comment.E0 = '5 cal per egg';

%% set weights for all real data
weights = setweights(data, []);
%weights.tj = 0 * weights.tj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Carapace length vs wet weight: (W in g) = 5.75e-4 (CL in mm)^3.0861';
metaData.bibkey.F1 = 'Mori1994'; 
F2 = 'Carapace length vs wet weight: (W in g) = 1.2e-3 (CL in mm)^2.9013';
metaData.bibkey.F2 = 'Krou1973'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7VDPQ'; % Cat of Life
metaData.links.id_ITIS = '97314'; % ITIS
metaData.links.id_EoL = '46505674'; % Ency of Life
metaData.links.id_Wiki = 'Homarus_americanus'; % Wikipedia
metaData.links.id_ADW = 'Homarus_americanus'; % ADW
metaData.links.id_Taxo = '33905'; % Taxonomicon
metaData.links.id_WoRMS = '156134'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Homarus_americanus}}';
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
bibkey = 'GendOuel2009'; type = 'Article'; bib = [ ... 
'author = {Gendron, L. and Ouellet, P.}, ' ... 
'year = {2009}, ' ...
'title = {EGG DEVELOPMENT TRAJECTORIES OF EARLY AND LATE-SPAWNER LOBSTERS (\emph{Homarus americanus}) IN THE {M}AGDALEN {I}SLANDS, {Q}uebec}, ' ...
'journal = {J. Crust. Biol.}, ' ...
'volume = {29}, ' ...
'pages = {356--363}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AttaHudo1987'; type = 'Article'; bib = [ ... 
'author = {J. Attard and C. Hudon}, ' ... 
'year = {1987}, ' ...
'title = {Embryonic Development and Energetic Investment in Egg Production in Relation to Size of Female Lobster (\emph{Homarus americanus})}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {44}, ' ...
'pages = {1157--1164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Krou1973'; type = 'Article'; bib = [ ... 
'author = {Krouse, J. S.}, ' ... 
'year = {1973}, ' ...
'title = {Maturity, sex ratio, and size composition of the natural population of {A}merican lobster, \emph{Homarus americanus}, along the {M}aine coast}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {71}, ' ...
'pages = {165--173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mori1994'; type = 'Techreport'; bib = [ ... 
'author = {M. Moriyasu}, ' ... 
'year = {1994}, ' ...
'title = {Length-weight relationship for lobster (\emph{Homarus americanus}) in three areas of the northern {N}orthumberland {S}trait}, ' ...
'institution = {Canadian Atlantic Fisheries Scientific Advisory Committee}, ' ...
'number = {84/94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/318853/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Homarus_americanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

