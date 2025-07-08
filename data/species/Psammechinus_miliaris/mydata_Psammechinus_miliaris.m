function [data, auxData, metaData, txtData, weights] = mydata_Psammechinus_miliaris
%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Parechinidae';
metaData.species    = 'Psammechinus_miliaris'; 
metaData.species_en = 'Green sea urchin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 03]; 

%% set data
% zero-variate data

data.tj = 45;    units.tj = 'd';    label.tj = 'time since birth at metam';    bibkey.tj = 'BIOTIC';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temps are guessed';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BIOTIC';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'BIOTIC';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.09;   units.Lj  = 'cm';  label.Lj  = 'length at metam';          bibkey.Lj  = 'guess';
  comment.Lj = 'guess based on Echinus_esculentus';
data.Lp  = 0.9;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty'; bibkey.Lp  = 'BIOTIC';
  comment.Lp = 'read from tL data for tp = 2 yr';
data.Li  = 5.75;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';  bibkey.Li  = 'Wiki';

data.Wwb = 5e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Zeut1955';
data.Wwj = 4.8e-4; units.Wwj = 'g';   label.Wwj = 'wet weight at puberty';    bibkey.Wwj = 'BIOTIC';
  comment.Wwj = 'computed as 0.4943 * Lj^2.877, see F1';
data.Wwp = 0.365;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'BIOTIC';
  comment.Wwp = 'computed as 0.4943 * Lp^2.877, see F1';
data.Wwi = 75.78;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = 'computed as 0.4943 * Li^2.877, see F1';

data.Ri  = 2.5e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';       bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% t-L data
data.tL = [ ... % time since settlement (d), test diameter (cm)
184.390	0.672
213.217	0.771
244.398	0.943
274.008	1.059
305.542	1.094
335.934	1.223
426.374	1.781];
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'test diameter'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kell2002';

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
F1 = 'weight-length: log10(W in g) = -3.183 + 2.877 * log10(diameter in mm), so W in g = 0.4943 * (diameter in cm)^2.877';
metaData.bibkey.F1 = 'RobiGree2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NBB9'; % Cat of Life
metaData.links.id_ITIS = '157954'; % ITIS
metaData.links.id_EoL = '599663'; % Ency of Life
metaData.links.id_Wiki = 'Psammechinus_miliaris'; % Wikipedia
metaData.links.id_ADW = 'Psammechinus_miliaris'; % ADW
metaData.links.id_Taxo = '41139'; % Taxonomicon
metaData.links.id_WoRMS = '124319'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Psammechinus_miliaris}}';
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
bibkey = 'Kell2002'; type = 'Article'; bib = [ ... 
'author = {M. S. Kelly}, ' ... 
'year = {2002}, ' ...
'title = {Survivorship and growth rates of hatchery-reared sea urchin}, ' ...
'journal = {Aquaculture International}, ' ...
'volume = {10}, ' ...
'pages = {309-316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zeut1955'; type = 'Article'; bib = [ ... 
'author = {E. Zeuten}, ' ... 
'year = {1955}, ' ...
'title = {Mitotic respiratory rhythms in single eggs of \emph{Psammechinus miliaris} and of \emph{Ciona intestinalis}}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {108}, ' ...
'number = {3}, ' ...
'pages = {366--385}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobiGree2010'; type = 'Article'; bib = [ ... 
'author = {L. A. Robinson and S. P. R. Greenstreet and H. Reiss and R. Callaway and J. Craeymeersch and I. de Boois and S. Degraer and S. Ehrich and H. M. Fraser and A. Goffin and I. Kroncke and L. Jorgenson and M. R. Robertson and J. Lancaster}, ' ... 
'year = {2010}, ' ...
'title = {Length-weight relationships of 216 {N}orth {S}ea benthic invertebrates and fish}, ' ...
'journal = {J. Mar. Bio. Assoc. UK}, ' ...
'volume = {90}, ' ...
'pages = {95-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BIOTIC'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4134}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/599663/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

