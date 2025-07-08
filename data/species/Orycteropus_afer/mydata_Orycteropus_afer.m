function [data, auxData, metaData, txtData, weights] = mydata_Orycteropus_afer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Tubulidentata'; 
metaData.family     = 'Orycteropodidae';
metaData.species    = 'Orycteropus_afer'; 
metaData.species_en = 'Aardvark'; 
metaData.ecoCode.climate = {'A', 'BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTh', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(34.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 08 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 12]; 

%% set data
% zero-variate data

data.tg = 225;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 103;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 29.8*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki: 18 yr';

data.Li  = 150;   units.Li  = 'cm';  label.Li  = 'ultimate nose-tail-length'; bibkey.Li  = 'brainmuseum';

data.Wwb = 800;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dula1987';
data.Wwx = 6250;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 60000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (kg)
3.534	0.830
6.451	1.189
8.536	1.358
8.739	1.623
10.615	1.830
14.564	2.811
17.467	3.887
17.879	4.189
21.822	5.491
29.727	7.057
33.047	8.170
36.174	8.453
39.913	9.472
45.124	9.981
48.030	10.868];
units.tW   = {'d', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Dula1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_2: tW data added; different Wwb value; Wwx ignored';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The aardvark cucumber, Cucumis humifructus, makes underground fruits, and depends on the aardvark for depersal';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74ZNF'; % Cat of Life
metaData.links.id_ITIS = '584927'; % ITIS
metaData.links.id_EoL = '327830'; % Ency of Life
metaData.links.id_Wiki = 'Orycteropus_afer'; % Wikipedia
metaData.links.id_ADW = 'Orycteropus_afer'; % ADW
metaData.links.id_Taxo = '69227'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11300004'; % MSW3
metaData.links.id_AnAge = 'Orycteropus_afer'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orycteropus_afer}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Orycteropus_afer}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'brainmuseum'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.brainmuseum.org/specimens/tubilidenta/aardvark/index.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dula1987'; type = 'Article'; bib = [ ... 
'author = {M. W. Dulaney}, ' ... 
'year = {1987}, ' ...
'title = {Mother-reared second-captive-generation aardvark \emph{Orycteropus afer} at the {Cincinnati Zoo}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {26}, ' ...
'pages = {281--285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

