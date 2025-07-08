function [data, auxData, metaData, txtData, weights] = mydata_Phoronis_psammophila

%% set metaData
metaData.phylum     = 'Phoronida'; 
metaData.class      = 'Phoronida'; 
metaData.order      = 'Phoronida'; 
metaData.family     = 'Phoronidae';
metaData.species    = 'Phoronis_psammophila'; 
metaData.species_en = 'Horseshoe worm'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 05]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'not clear';
data.tj = 13;    units.tj = 'd';    label.tj = 'time since at birth at metam'; bibkey.tj = 'Herr1979';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 200;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on am';
data.am = 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 13;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Herr1979';

data.Wwb = 1.1e-7;      units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Emig2003';
  comment.Wwb = 'based on egg diameter of 60 mum: pi/6*0.006^3';
data.Wwi = 0.10;      units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Herr1979';
  comment.Wwi = 'based on Wi = Li * pi * (Ld/2)^2  with Ld = 1 (0.5 to 2) mm diameter';

data.Ri  = 2.5*28/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Phoronis_pallida';
  
% uni-variate data
% t-L data for larvae
tLL = [ ... % time since birth (d), trunc width, larval length (mum)
0	41.913 157.617
2	42.968 175.171
4	46.795 221.808
6	55.773 277.636
8	68.513 344.034
10	78.083 448.739
12	84.290 632.535
13	86.796 727.106];
data.tW  = [tLL(:,1), tLL(:,2).^2 .* tLL(:,3) * pi/4e12];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(19);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Herr1979';
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
metaData.links.id_CoL = '4GRZX'; % Cat of Life
metaData.links.id_ITIS = '155467'; % ITIS
metaData.links.id_EoL = '46555625'; % Ency of Life
metaData.links.id_Wiki = 'Phoronis_psammophila'; % Wikipedia
metaData.links.id_ADW = 'Phoronis_psammophila'; % ADW
metaData.links.id_Taxo = '40610'; % Taxonomicon
metaData.links.id_WoRMS = '128552'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoronis_psammophila}}';
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
bibkey = 'Herr1979'; type = 'Article'; bib = [ ... 
'author = {K. Herrmann}, ' ... 
'year = {1979}, ' ...
'title = {Larvalentwicklung und {M}etamorphose von \emph{Phoronis psammophila} ({P}horonida, {T}entaculata)}, ' ...
'journal = {Helgol\"{a}nder wiss. Meeresunters.}, ' ...
'volume = {32}, ' ...
'pages = {550-581}'];
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

