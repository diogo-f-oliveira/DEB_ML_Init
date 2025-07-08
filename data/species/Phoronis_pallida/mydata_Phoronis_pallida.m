function [data, auxData, metaData, txtData, weights] = mydata_Phoronis_pallida

%% set metaData
metaData.phylum     = 'Phoronida'; 
metaData.class      = 'Phoronida'; 
metaData.order      = 'Phoronida'; 
metaData.family     = 'Phoronidae';
metaData.species    = 'Phoronis_pallida'; 
metaData.species_en = 'Horseshoe worm'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 07 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2019 03 14];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 14]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'not clear';
data.tp = 200;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on am';
data.am = 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Emig2003';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 14;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Emig1979';

data.Wwb = 1.1e-7;      units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Emig2003';
  comment.Wwb = 'based on egg diameter of 60 mum: pi/6*0.006^3';
data.Wwi = 0.11;      units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Emig1979';
  comment.Wwi = 'based on Wi = Li * pi * (Ld/2)^2  with Ld = 1 mm diameter (Emig1979)';

data.Ri  = 2.5*28/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Meye2014';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'not clear; hard to believe that only such few tiny eggs are produced';
  
% uni-variate data
% t-L data for larvae at 16 C from Sant2004
tLL = [ ... % time since birth (d), trunc width, larval length (cm)
4	0.0058 0.0112
9	0.0068 0.0137
16	0.0075 0.0198
20	0.0102 0.0250
31	0.0123 0.0319
44	0.0158 0.0388
50	0.0212 0.0449
74	0.0213 0.0445];
data.tW  = [tLL(:,1), tLL(:,2).^2 .* tLL(:,3) * pi/4];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(16);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sant2004';
comment.tW = 'Weights computed from larval length L and diameter D as D^2*L*pi/4';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'The analysis assumes that pre- and post-metamorphic stages have the same parameters; this is probably incorrect and model abj probably applies';
D2 = 'The assumed life span is probably much too long and the measured reproduction rate much too small';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D4 = 'mod_3: lengths converted to weights';
metaData.discussion = struct('D1', D1,'D2', D2,'D3', D3, 'D4', D4);

%% Facts
F1 = 'Occurs at depths between 0 and 10 (till 100) m; Hermaphroditic. Giant nerve cells';
metaData.bibkey.F1 = 'Emig1979'; 
F2 = ['Asexual reproduction is by transverse fission after sufficient gonadic material had been formed. ', ...
    'The actinotroch larve swims for about 20 days, settles on the seabed and undergoes a catastrophic metamorphosis in 30 minutes'];
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4GRZV'; % Cat of Life
metaData.links.id_ITIS = '155465'; % ITIS
metaData.links.id_EoL = '46555624'; % Ency of Life
metaData.links.id_Wiki = 'Phoronis_pallida'; % Wikipedia
metaData.links.id_ADW = 'Phoronis_pallida'; % ADW
metaData.links.id_Taxo = '40609'; % Taxonomicon
metaData.links.id_WoRMS = '128551'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoronis}}';
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
bibkey = 'Sant2004'; type = 'Article'; bib = [ ... 
'author = {Santagata, S.}, ' ... 
'year = {2004}, ' ...
'title = {Larval Development of \emph{Phoronis pallida} ({P}horonida): {I}mplications for Morphological Convergence and Divergence Among Larval Body Plans}, ' ...
'journal = {JOURNAL OF MORPHOLOGY}, ' ...
'volume = {259}, ' ...
'pages = {347-358}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Emig1979'; type = 'Book'; bib = [ ... 
'author = {C. C. Emig}, ' ... 
'year = {1979}, ' ...
'title = {British and other Phoronids}, ' ...
'sereis = {Synopsis of the British Fauna}, ' ...
'volume = {13}, ' ...
'publisher = {Acad. Press}, '...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Emig2003'; type = 'Incollection'; bib = [ ... 
'author = {C. C. Emig}, ' ... 
'year = {2003}, ' ...
'title = {Phylum {P}horonida}, ' ...
'booktitle = {Protostomes. Grzimeks Animal Life Encyclopedia}, ' ...
'editor = {B. Grzimek}, ' ...
'publisher = {Gale}, '...
'address = {Detroit}, ', ...
'pages = {491--497}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Meye2014'; type = 'Misc'; bib = [ ...
'author = {K. Meyer}, ' ...
'year = {2014}, ' ...
'howpublished = {\url{https://scholarsbank.uoregon.edu/xmlui/bitstream/handle/1794/12926/P_pallida revised.pdf?sequence=3}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

