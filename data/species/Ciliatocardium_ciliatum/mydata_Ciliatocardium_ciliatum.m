function [data, auxData, metaData, txtData, weights] = mydata_Ciliatocardium_ciliatum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Cardiidae';
metaData.species    = 'Ciliatocardium_ciliatum'; 
metaData.species_en = 'Iceland cockle'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'0jMp','jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 24]; 


%% set data
% zero-variate data

data.am = 24*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'TallSund2000';   
  temp.am = C2K(3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.2;   units.Lj  = 'cm';  label.Lj  = 'shell length at metam';   bibkey.Lj  = 'guess';
data.Lp  = 1.2;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Card2009';
  comment.Lp = 'Value for Cerastoderma_edule';
data.Li  = 4.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'TallSund2000';

data.Wwb = 1.44e-07;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based from guessed egg diameter of 65 mum: pi/6*0.0065^3';
data.Wwi = 11.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';
  comment.Wwi = 'based on Macoma baltica';

data.Ri  = 4657; units.Ri  = '#/d';     label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Honk1998';   
  temp.Ri = C2K(3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Value for Cerastoderma_edule';
  
% uni-variate data
% t-L data
data.tL = [ ... %  time since settlement (yr), shell length (cm)
1.957	0.388
2.889	0.755
3.868	1.143
5.033	1.612
5.965	2.041
6.990	2.510
7.876	2.796
9.041	3.082
10.113	3.347
11.045	3.510
12.070	3.714
13.095	3.837
14.074	3.939
15.192	4.041
16.171	4.163
17.056	4.204
18.128	4.265
19.060	4.306
20.132	4.408
21.157	4.367
22.136	4.408
23.115	4.429];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TallSund2000';
comment.tL = 'Data from Storfjorden 1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'VBRL'; % Cat of Life
metaData.links.id_ITIS = '80867'; % ITIS
metaData.links.id_EoL = '46473695'; % Ency of Life
metaData.links.id_Wiki = 'Clinocardium_ciliatum'; % Wikipedia
metaData.links.id_ADW = 'Clinocardium_ciliatum'; % ADW
metaData.links.id_Taxo = '3948611'; % Taxonomicon
metaData.links.id_WoRMS = '139000'; % WoRMS
metaData.links.id_molluscabase = '139000'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clinocardium_ciliatum}}';
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
bibkey = 'TallSund2000'; type = 'Article'; bib = [ ... 
'author = {Minna Elisabeth Tallqvist and Jan Henry Sundet}, ' ... 
'year = {2000}, ' ...
'title = {Annual growth of the cockle \emph{Clinocardium ciliatum} in the {N}orwegian {A}rctic ({S}valbard area)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {440}, ' ...
'pages = {331-338}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Ciliatocardium-ciliatum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46473695}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Honk1998'; type = 'Phdthesis'; bib = [ ... 
'author = {Honkoop, P. J. C.}, ' ... 
'year = {1998}, ' ...
'title = {Bivalve reproduction in the {W}adden {S}ea; {E}ffects of winter conditions on reproductive effort and recruitment}, ' ...
'school = {Groningen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Card2009'; type = 'Misc'; bib = [ ...
'author = {Cardosa, J. M. F.}, ' ...
'year = {2009}, ' ...
'note = {personal observation}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

