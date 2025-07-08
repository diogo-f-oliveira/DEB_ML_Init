function [data, auxData, metaData, txtData, weights] = mydata_Necturus_maculosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Proteidae';
metaData.species    = 'Necturus_maculosus'; 
metaData.species_en = 'Common mudpuppy'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 28];

%% set data
% zero-variate data

data.ab = 60;   units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'AnAge';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: 40 d';
data.tp = 6*365;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 34*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ADW'; 
data.Lp  = 20;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wiki'; 
data.Li = 40;      units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li  = 'Wiki';
  comment.Li = 'Wiki gives 33 cm, but 43.5 cm has been reported, EoL gives 48.6 cm';

data.Wwb = 0.0871; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on freshly-laid egg diameter 5-6 mm : pi/6*0.55^3';
data.Wwp = 100;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'computed from Wwi*(Lp/Lm)^3: 453*(20/33)^3';
data.Wwi = 453;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'landconservationfoundation';

data.Ri  = 68/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki 20-200 eggs per clutch';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), length (cm)
4.119	12.202
5.101	13.961
6.141	14.878
7.210	15.879
8.278	16.671
9.258	17.462
10.356	18.085
11.453	18.288
12.489	18.196
13.529	19.156
14.567	19.527
15.633	19.477
16.701	20.016];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Senn1940';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Males swim and crawl around the females and eventually deposit a 1 cm spermatophore. Females pick up the spermatophores in their cloaca, where it is stored until spring';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '463VD'; % Cat of Life
metaData.links.id_ITIS = '173630'; % ITIS
metaData.links.id_EoL = '313513'; % Ency of Life
metaData.links.id_Wiki = 'Necturus_maculosus'; % Wikipedia
metaData.links.id_ADW = 'Necturus_maculosus'; % ADW
metaData.links.id_Taxo = '47268'; % Taxonomicon
metaData.links.id_WoRMS = '1506616'; % WoRMS
metaData.links.id_amphweb = 'Necturus+maculosus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Necturus_maculosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Necturus_maculosus}}';
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
bibkey = 'Spar2014'; type = 'Book'; bib = [ ... 
'author = {M. Sparreboom}, ' ... 
'year = {2014}, ' ...
'title = {Salamanders of the Old World}, ' ...
'publisher = {KNNV}, ' ...
'address = {Untrecht}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Senn1940'; type = 'Article'; bib = [ ... 
'doi = {10.1002/aja.1000660307}, ' ...
'author = {William C. Senning}, ' ... 
'year = {1940}, ' ...
'title = {A study of age determination and growth of \emph{Necturus maculosus} based on the parasphenoid bone}, ' ...
'journal = {American Journal of Anatomy}, ' ...
'volume = {66(3)}, ' ...
'pages = {1483–495}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Necturus+maculosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Necturus_maculosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Necturus_maculosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'landconservationfoundation'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.landconservationfoundation.org/all-about-mudpuppies}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

