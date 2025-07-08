function [data, auxData, metaData, txtData, weights] = mydata_Sepia_pharaonis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiida'; 
metaData.family     = 'Sepiidae';
metaData.species    = 'Sepia_pharaonis'; 
metaData.species_en = 'Pharaoh cuttlefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 29]; 

%% set data
% zero-variate data

data.ab = 15;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'AnilAndr2005';   
  temp.ab = C2K(29);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 766;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'SasiMoha2013';   
  temp.am = C2K(29);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.amm = 839;     units.amm = 'd';    label.amm = 'life span for males';   bibkey.amm = 'SasiMoha2013';   
  temp.amm = C2K(29);     units.temp.amm = 'K'; label.temp.amm = 'temperature'; 

data.Lb = 0.8;    units.Lb = 'cm';   label.Lb = 'mantle length at birth';   bibkey.Lb = 'AnilAndr2005';
data.Lp = 12;    units.Lp = 'cm';   label.Lp = 'mantle length at puberty';   bibkey.Lp = 'SasiMoha2013';
data.Lpm = 7;    units.Lpm = 'cm';   label.Lpm = 'mantle length at puberty for males';   bibkey.Lpm = 'SasiMoha2013';
data.Li = 50;    units.Li = 'cm';   label.Li = 'mantle length at death';   bibkey.Li = 'AnilAndr2005';
data.Lim = 80;    units.Lim = 'cm';   label.Lim = 'mantle length at death for male';   bibkey.Lim = 'AnilAndr2005';

data.Wwb = 0.16;    units.Wwb = 'g';   label.Wwb = 'weight at birth';   bibkey.Wwb = 'AnilAndr2005';
data.Wwi = 2e3;    units.Wwi = 'g';   label.Wwi = 'weight at death';   bibkey.Wwi = 'AnilAndr2005';
data.Wwim = 5e3;    units.Wwim = 'g';   label.Wwim = 'weight at death for male';   bibkey.Wwim = 'ADW';
  comment.Wwim = 'note that (Lim/Li)^3*Wwi = 8.2e3 g';

data.Ni  = 307; units.Ni  = '#';   label.Ni  = 'cum reprod at 240 d';     bibkey.Ni  = 'AnilAndr2005';   
  temp.Ni = C2K(29);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
  0  0.8
 30  2.0
 60  3.2
 90  5.9
120  9.5
150 12.8
180 14.5
210 16.8];
units.tL   = {'d', 'cm'};  label.tL = {'time time birth', 'mantle length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AnilAndr2005';

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
  0   0.16
 30   1.9
 60   9.2
 90  34 
120  85
150 135
180 325
210 521];
units.tWw   = {'d', 'g'};  label.tWw = {'time time birth', 'wet weight'};  
temp.tWw   = C2K(29);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'AnilAndr2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.am = 3 * weights.am;
weights.amm = 3 * weights.amm;
weights.Wwi = 0 * weights.Wwi;
weights.Wwim = 0 * weights.Wwim;
weights.Lb = 8 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}, E_Hp and h_a only';
D2 = 'Wwim and Wwi were ignorned because of inconsistency';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'semelparous: death at first spawning';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WQKT'; % Cat of Life
metaData.links.id_ITIS = '556117'; % ITIS
metaData.links.id_EoL = '398542'; % Ency of Life
metaData.links.id_Wiki = 'Sepia_pharaonis'; % Wikipedia
metaData.links.id_ADW = 'Sepia_pharaonis'; % ADW
metaData.links.id_Taxo = '157585'; % Taxonomicon
metaData.links.id_WoRMS = '181376'; % WoRMS
metaData.links.id_molluscabase = '181376'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepia_pharaonis}}';
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
bibkey = 'AnilAndr2005'; type = 'article'; bib = [ ...
'author = {M.K. Anil and Joseph Andrews and C. Unnikrishnan}, ' ... 
'year = {2005}, ' ...
'title = {GROWTH, BEHAVIOR, AND MATING OF PHARAOH CUTTLEFISH (\emph{Sepia pharaonis} {E}HRENBERG) IN CAPTIVITY}, ' ...
'journal = {The Israeli Journal of Aquaculture Bamidgeh}, ' ...
'volume = {57(1)}, ' ...
'pages = {25-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SasiMoha2013'; type = 'article'; bib = [ ...
'author = {Geetha Sasikumar and K.S. Mohamed and U.S. Bhat}, ' ... 
'year = {2013}, ' ...
'title = {Inter-cohort growth patterns of pharaoh cuttlefish \emph{Sepia pharaonis} ({S}epioidea: {S}epiidae) in Eastern {A}rabian {S}ea}, ' ...
'journal = {Rev. Biol. Trop. (Int. J. Trop. Biol.}, ' ...
'volume = {61(1)}, ' ...
'pages = {1-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sepia-pharaonis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sepia_pharaonis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

