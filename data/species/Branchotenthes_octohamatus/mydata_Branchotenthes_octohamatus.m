function [data, auxData, metaData, txtData, weights] = mydata_Branchotenthes_octohamatus

%% set metaData
metaData.phylum     = 'Platyhelminthes'; 
metaData.class      = 'Monogenea'; 
metaData.order      = 'Diclybothriidea'; 
metaData.family     = 'Hexabothriidae';
metaData.species    = 'Branchotenthes_octohamatus'; 
metaData.species_en = 'Ray flatworm'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biTvf'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tL'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 21]; 


%% set data
% zero-variate data

data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'GlenChis2007';   
  temp.ab = C2K(22);     units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '8 to 10 d';
data.tp = 91;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'GlenChis2007';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 0.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'on information found, very unriable guess';

data.Lb  = 0.014;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GlenChis2007';
data.Lp  = 0.537;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'GlenChis2007';
data.Li  = 0.6627;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'GlenChis2005';

data.Wwb = 2.3e-13;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GlenChis2007';
  comment.Wwb = 'based on egg length of 139 mum, width 68 mum: pi/6*0.00139*0.00068^3';
data.Wwp = 1.3e-3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'GlenChis2007';
  comment.Wwp = 'based on cilinder with diameter 555 mum and length Lp: 0.537*0.0555^2*pi/4';
data.Wwi = 2.6e-3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'GlenChis2007';
  comment.Wwi = 'based on cilinder with mean diameter of 700 mum (max is 1384 mum) and length Li: 0.663*0.07^2*pi/4';

data.Ri  = 1e4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '122 egggs are laid in a chain, but no info was found on chain production over time';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (mum)
     7  140
    14  226
    21  244
    28  355
    35  460
    42  784
    49 1400
    70 4562
    91 5376];
data.tL(:,2) = data.tL(:,2)/ 1e4; % convert mum to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(24); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GlenChis2007';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 0 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 10 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Hermaphroditic, so kap_R is halved';
D2 = 'The very low energy conductance that was found is due to long incubation time, which might include a torpor period';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Hatching is induced by agitation';
metaData.bibkey.F1 = 'GlenChis2007'; 
F2 = 'Hexabothriidae includes polyopisthocotylean monogeneans exclusively parasitic on the gills of chondrichthyan fishes';
metaData.bibkey.F2 = 'GlenChis2005'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5WRC5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46484942'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3995246'; % Taxonomicon
metaData.links.id_WoRMS = '396288'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hexabothriidae}}';
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
bibkey = 'GlenChis2007'; type = 'Article'; bib = [ ... 
'author = {Glennon, Vanessa and Chisholm, Leslie Anne and Whittington, Ian David}, ' ... 
'year = {2007}, ' ...
'title = {Experimental infections, using a fluorescent marker, of two elasmobranch species by unciliated larvae of \emph{Branchotenthes octohamatus} ({M}onogenea: {H}exabothriidae): invasion route, host specificity and post-larval development}, ' ...
'journal = {Parasitology}, ' ...
'volume = {134}, ' ...
'pages = {1243-1252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GlenChis2005'; type = 'Article'; bib = [ ... 
'author = {Vanessa Glennon and Leslie A. Chisholm and Ian D. Whittington}, ' ... 
'year = {2005}, ' ...
'title = {\emph{Branchotenthes octohamatus} sp. n. ({M}onogenea: {H}exabothriidae) from the gills of the southern fiddler ray, \emph{Trygonorrhina fasciata} ({R}hinobatidae) in {S}outh {A}ustralia: description of adult and larva}, ' ...
'journal = {FOLIA PARASITOLOGICA}, ' ...
'volume = {52}, ' ...
'pages = {223-230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

