function [data, auxData, metaData, txtData, weights] = mydata_Clione_limacina

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Gymnosomata'; 
metaData.family     = 'Clionidae';
metaData.species    = 'Clione_limacina'; 
metaData.species_en = 'Naked sea butterfly'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN', 'MAN', 'MN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCim'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jaap van der Meer'};    
metaData.date_subm = [2011 11 20];              
metaData.email    = {'Jaap.van.der.Meer@nioz.nl'};            
metaData.address  = {'NIOZ, Texel'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2012 01 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2015 12 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2016 10 15];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 3.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = {'Boer2005','LallCono1973'};   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 14;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Boer2005';   
  temp.tj = C2K(16);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 30;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Boer2005';
  temp.tp = C2K(16);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 730;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Lifespan is quite uncertain, two years are mentioned';
  
data.Lb  = 0.016; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Boer2005';
data.Lj  = 0.2;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'Boer2005';
data.Lp  = 1.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Boer2005';
data.Li  = 8.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = {'Boer2005','LallGilm1989'};

data.Wdb = 1.25e-8; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'BoerGann2005';
  comment.Wdb = 'Dry weight is guesstimated on the bais of length-dry weight relationship. See dataset 1.';
data.Wdp = 0.003;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'BoerGann2005';
  comment.Wdp = 'Dry weight is guesstimated on the bais of length-dry weight relationship. See dataset 1.';
data.Wdi = 0.546;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'BoerGann2005';
  comment.Wdi = 'Dry weight is guesstimated on the bais of length-dry weight relationship. See dataset 1.';

data.Ri  = 3e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'Boer2005','LallGilm1989'};   
  temp.Ri = C2K(2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'LallGilm1989 report 2800 eggs for a 77 mm sized animal. I presume one egg bath per year, but this is uncertain';
 
% uni-variate data
% L-W data
data.LW = [ ...
    2.0  8.0 10.0 12.9 15.1 15.1 15.0 16.7 17.0 18.0 17.9 19.0 19.2 19.9 20.0 20.9 21.9 21.9 22.0 25.0 25.1 26.9 24.3 28.0 31.9 27.0 26.9 28.0 28.5 27.9 32.0 32.0 34.1 35.0 36.0 42.1 42.0 47.9 38.0 37.0 33.0 32.9 38.0 42.0 42.0 45.0 48.0 52.0 51.2; 
    0.26 4.09 3.07 5.88 9.20 4.60 7.41 5.11 11.25 13.80 8.43 7.16 10.22 14.31 21.21 8.43 12.78 9.46 25.81 17.12 15.34 14.57 2.81 5.62 20.45 26.33 35.02 37.32 30.42 31.69 39.62 29.65 39.87 25.05 26.84 13.04 38.08 44.73 37.06 57.00 52.65 59.30 93.04 98.15 72.33 85.88 88.18 109.65 119.62]'; 
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'dry weight'};  
bibkey.LW = 'BoerGann2005';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 20 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'The animals hatch into a veliger larva in 3-4 days at 16 deg C. The larva is about 0.16 mm with a wet weight of about 0.1 mu g';
metaData.bibkey.F1 = 'Boer2005';
F2 = 'The northern subspecies lives in colder water, matures at 3 cm and can reach a size of 7-8.5 cm. The southern subspecies is 1.2 cm';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Simultaneous hermaphrodite';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'W7KY'; % Cat of Life
metaData.links.id_ITIS = '78089'; % ITIS
metaData.links.id_EoL = '46448551'; % Ency of Life
metaData.links.id_Wiki = 'Clione_limacina'; % Wikipedia
metaData.links.id_ADW = 'Clione_limacina'; % ADW
metaData.links.id_Taxo = '38184'; % Taxonomicon
metaData.links.id_WoRMS = '139178'; % WoRMS
metaData.links.id_molluscabase = '139178'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clione_limacina}}';
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
bibkey = 'Boer2005'; type = 'Phdthesis'; bib = [ ... 
'author = {Boer, M.}, ' ... 
'year = {2005}, ' ...
'title = {Die {F}lugelschnecke \emph{Clione limacina}: {A}ussergew\"{o}hnliche {L}ipide als {A}npassungsstrategie an den {L}ebensraum {A}rktis}, ' ...
'school = {Universit\"{a}t Bremen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoerGann2005'; type = 'Article'; bib = [ ... 
'author = {Boer, M. and Gannefors, C. and Kattner, G. and Graeve, M. and Hop, H. and Falk-Petersen, S.}, ' ... 
'year = {2005}, ' ...
'title = {The {A}rctic pteropod \emph{Clione limacina}: seasonal lipid dynamics and life-strategy}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {147}, ' ...
'pages = {707--717}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LallCono1973'; type = 'Article'; bib = [ ... 
'author = {Lalli, C. M. and Conover, R. J.}, ' ... 
'year = {1973}, ' ...
'title = {Reproduction and development of \emph{Paedoclione doliiformis}, and a comparison with \emph{Clione limacina} ({O}pisthobranchia-{G}ymnosomata)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {19}, ' ...
'pages = {13--22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LallGilm1989'; type = 'Article'; bib = [ ... 
'author = {Lalli, C. M. and Gilmer, R. W.}, ' ... 
'year = {1989}, ' ...
'title = {Pelagic snails. The biology of holoplanktonic gastropod mollusks}, ' ...
'publisher = {Stanford University Press}, ' ...
'address = {Stanford, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

