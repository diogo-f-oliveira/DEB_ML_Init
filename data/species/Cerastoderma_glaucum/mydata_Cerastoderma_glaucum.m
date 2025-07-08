function [data, auxData, metaData, txtData, weights] = mydata_Cerastoderma_glaucum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Cardiidae';
metaData.species    = 'Cerastoderma_glaucum'; 
metaData.species_en = 'Lagoon cockle'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 11]; 

%% set data
% zero-variate data

data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Card2007';   
  temp.ab = C2K(11);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Data for C. edule';
data.tj = 11;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'marlin';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'time since birth at settlement 11 till 30 d, but temp is guessed ';
data.am = 5*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'marlin';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.96;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KandMoha2013';
  comment.Lp = 'Data for female';
data.Li  = 5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 2.2e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'marlin_Ce';
  comment.Wwb = 'Based on 75 mum egg diameter for C. edule: 4/3*pi*0.00375^3';
data.Ww15 = 0.17;units.Ww15 = 'g';   label.Ww15 = 'wet weight at shell length 15 mm';   bibkey.Ww15 = 'KandMoha2013';

data.Ri  = 4657.5; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Honk1998';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Data for C. edule';
   
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.067	0.743
0.223	1.356
0.351	1.743
0.494	2.149
0.574	2.234
0.721	2.311
0.761	2.532];
data.tL(:,1) = (.15 + data.tL(:,1)) * 365; % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ivel1979';

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

%% Links
metaData.links.id_CoL = 'SKNH'; % Cat of Life
metaData.links.id_ITIS = '205619'; % ITIS
metaData.links.id_EoL = '46473664'; % Ency of Life
metaData.links.id_Wiki = 'Cerastoderma_glaucum'; % Wikipedia
metaData.links.id_ADW = 'Cerastoderma_glaucum'; % ADW
metaData.links.id_Taxo = '84902'; % Taxonomicon
metaData.links.id_WoRMS = '138999'; % WoRMS
metaData.links.id_molluscabase = '138999'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cerastoderma_glaucum}}';
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
bibkey = 'Ivel1979'; type = 'Article'; bib = [ ... 
'author = {Ivell, R.}, ' ... 
'year = {1979}, ' ...
'title = {The biology and ecology of a brackish lagoon bivalve, \emph{Cerastoderma glaucum} {B}ruguiere, in {L}ago {L}ungo, {I}taly}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {45}, ' ...
'pages = {364--382}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KandMoha2013'; type = 'Article'; bib = [ ... 
'author = {K. E. Kandeel and S. Z. Mohammed and A. M. Mostafa  and M. E. Abd-Alla}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of the cockle \emph{Cerastoderma glaucum} ({B}ivalvia: {C}ardiidae) from {L}ake {Q}arun, {E}gypt}, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {39}, ' ...
'pages = {249-260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Card2007'; type = 'Phdthesis'; bib = [ ... 
'author = {Cardosa, J. M. F.}, ' ... 
'year = {2007}, ' ...
'title = {Growth and reproduction in bivalves; An Dynamic Energy Budget approach}, ' ...
'school = {Groningen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Card2009'; type = 'Misc'; bib = [ ...
'author = {Cardosa, J. M. F.}, ' ...
'year = {2009}, ' ...
'note = {presonal observation}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Honk1998'; type = 'Phdthesis'; bib = [ ... 
'author = {Honkoop, P. J. C.}, ' ... 
'year = {1998}, ' ...
'title = {Bivalve reproduction in the {W}adden {S}ea; {E}ffects of winter conditions on reproductive effort and recruitment}, ' ...
'school = {Groningen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4195}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin_Ce'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4227}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
