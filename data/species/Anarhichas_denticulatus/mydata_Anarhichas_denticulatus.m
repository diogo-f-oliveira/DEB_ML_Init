function [data, auxData, metaData, txtData, weights] = mydata_Anarhichas_denticulatus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anarhichadidae';
metaData.species    = 'Anarhichas_denticulatus'; 
metaData.species_en = 'Northern wolffish'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0bMcb', 'bpMp', 'piMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp, according to Wiki they live in temperature from 2-5 deg C
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [20 09 2016];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Fram High North Research Centre for Climate and the Environment, 9296 Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 09 20]; 

%% set data
% zero-variate data

data.ab = 10*30;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ShevJoha2011';   
  temp.ab = C2K(3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'pp. 331 says that incubation time for all three wolf fish species is 9-10 months';
data.ap = 6*365;    units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'WienJoha2011';
  temp.ap = C2K(3);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'females mature at 6-8 years or more';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';     bibkey.am = 'WienJoha2011';   
  temp.am = C2K(3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'They live at least 16 years';
  
% data.L0  = 8;   units.L0  = 'mm';  label.L0  = 'egg diameter';   bibkey.L0  = 'Wiki';  
% comment.L0 = 'up to 8 mm';
data.Lb  = 2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'MunkNiel2005';  
  comment.Lb = 'yolk sac is resobed at ca 20 mm for both A. lupus and A. minor';
data.Lp  = 80;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WienJoha2011'; 
  comment.Lp = 'pp. 227';
data.Li  = 138;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'WienJoha2011';

data.Wwi = 32 * 1e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'WienJoha2011'};

data.Ri  = 42500/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'WienJoha2011';   
temp.Ri = C2K(3);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is between 2-5 degC'; 

% uni-variate data
% time-length
data.tL = [ ... year, average total length
    4 5 6 7 8 9 10 11 12;
    79 82 87 92.3 102.1 107.3 111.5 113.8 115.0]';  % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) * 365; % convert year to day
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Andr1954'; comment.tL = 'temp is typical temperature. The orginial document (pp.236)) says it is age in years, se we assume this is from otholiths, meaning it must be from hatch/birth onwards';

% length-weight
data.tW = [ ... % year , wet weight (kg) 
    4   5   6    7    8    9    10   11 ;
    6.9 7.8 10.1 10.5 13.5 15.4 17.8 19.0
    ]';  
data.tW(:,1) = data.tW(:,1) * 365; % convert year to day
data.tW(:,2) = data.tW(:,2) * 1e3; % convert kg to g
temp.tW    = C2K(3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
bibkey.tW = 'Andr1954'; comment.tW = 'same comment as for data.tL';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Found in the North Atlantic and Arctic (Norwegian and Barents sea)';
metaData.bibkey.F1 = 'WienJoha2011'; 
F2 = 'Tolerates temperatures from -1.4 to 7 deg C';
metaData.bibkey.F2 = 'WienJoha2011'; 
F3 = 'Fastest growing of the three wolf fishes in the Barents sea, feeds on soft shelled bottom invertebrates, ctenophors, jellyfish and fish. ';
metaData.bibkey.F3 = 'WienJoha2011'; 
F4 = 'sheds teech in  Feb-March because it sheds its teath';
metaData.bibkey.F4 = 'WienJoha2011'; 
F5 = 'Spawns april to october but peak spawning is in summer at depths below 400m';
metaData.bibkey.F5 = 'WienJoha2011'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'DGB2'; % Cat of Life
metaData.links.id_ITIS = '550561'; % ITIS
metaData.links.id_EoL = '46574576'; % Ency of Life
metaData.links.id_Wiki = 'Anarhichas_denticulatus'; % Wikipedia
metaData.links.id_ADW = 'Anarhichas_denticulatus'; % ADW
metaData.links.id_Taxo = '160816'; % Taxonomicon
metaData.links.id_WoRMS = '126757'; % WoRMS
metaData.links.id_fishbase = 'Anarhichas-denticulatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Northern_wolffish}}';
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
bibkey = 'WienJoha2011'; type = 'book'; bib = [ ... % OK (MAW)
'author = {Wienerroither, R. and Johannesen, E. and Dolgov, A. and Byrkjedal, I. and Bjelland, O. and Drevetnyak, K. and Eriksen, K. B. and H{\o}ines, \r{A}. and Langhelle, G. and Lang{\o}y H. and Prokhorova, T. and Prozorkevich, D. and Wenneck, T.}, ' ... 
'year = {2011}, ' ...
'title = {Atlas of the {B}arents {S}ea fishes}, ' ...
'publisher = {IMR/PINRO}, ' ...
'howpublished = {\url{http://www.imr.no/filarkiv/2011/09/atlas_august_2011_press_quality_til_web.pdf/nb-no}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShevJoha2011'; type = 'incollection'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Shevelev, M. S. and Johannesen, E.}, ' ...
'year = {2011}, ' ...
'title  = {Wolfish}, ' ...
'chapter     = {5.10},'...
'booktitle  = {Wolfish}, ' ...
'editor  = {Jakobsen, T. and Ozhigin, V. K.}, ' ...
'publisher = {The Barents Sea. Ecosystem, Resources, Managment. {H}alf a century of {R}ussian-{N}orwegian cooperation}, ' ...
'pages = {329--337}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'pages = {128-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Andr1954'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Andriyashev, A. P.}, ' ...
'year = {1954}, ' ...
'title  = {Fishes of the {N}orthern {S}eas of the {U}.{S}.{S}.{R}.}, ' ...
'publisher = {Izdatelstvo Akademii Nauk SSSR}, ' ...
'note = {translated from russian}, ' ...
'pages = {236}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
