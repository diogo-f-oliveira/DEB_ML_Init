function [data, auxData, metaData, txtData, weights] = mydata_Lytechinus_variegatus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Toxopneustidae';
metaData.species    = 'Lytechinus_variegatus'; 
metaData.species_en = 'Green sea urchin'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 04]; 

%% set data
% zero-variate data

data.tj = 8*7;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'EoL';
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AlbrBlan2012';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'EoL';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';   bibkey.Lp  = 'AlbrBlan2012';
data.Li  = 11;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';     bibkey.Li  = 'Wiki';

data.Wwb = 8.8e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'value taken from Echinocardion cordatum';
data.Wwp = 28;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'AlbrBlan2012';
  comment.Wwp = 'computed as (Lp/Li)^3*Wwi';
data.Wwi = 595;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on weight Echinus esculentus of 11 cm';

data.Ri = 4.9e6/365;    units.Ri = 'd';    label.Ri = 'max reprod rate';        bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Echinus esculentus: 20e6 * (11/17.6)^3 per yr)';

 
% uni-variate data

% t-W data
data.tW = [ ... % time since settlement (d), wet weight (g)
0.000	0.034
11.543	0.096
24.524	0.392
40.097	1.074
55.794	2.832
67.881	4.722
88.754	7.519];
units.tW   = {'d', 'g'};  label.tW = {'time since settlement', 'wet weight'};  
temp.tW    = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AlbrBlan2012';
  
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

%% Discussion points
D1 = 'Weight at birth is guessed from Sterechinus which has Wd0 of 0.5 mug';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3WVCB'; % Cat of Life
metaData.links.id_ITIS = '157921'; % ITIS
metaData.links.id_EoL = '47039804'; % Ency of Life
metaData.links.id_Wiki = 'Lytechinus_variegatus'; % Wikipedia
metaData.links.id_ADW = 'Lytechinus_variegatus'; % ADW
metaData.links.id_Taxo = '41124'; % Taxonomicon
metaData.links.id_WoRMS = '367850'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lytechinus_variegatus}}';
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
bibkey = 'AlbrBlan2012'; type = 'Article'; bib = [ ... 
'author = {R. Albright and C. Blanda and P. Gillettea and J. E. Serafy and C. Langdona and T. R. Capoa}, ' ... 
'year = {2012}, ' ...
'title = {Juvenile growth of the tropical sea urchin \emph{Lytechinus variegatus} exposed to near-future ocean acidification scenarios}, ' ...
'journal = {Exp Mar Bio Ecol.}, ' ...
'doi = {10.1016/j.jembe.2012.05.017}, ' ...
'volume = {426-427}, ' ...
'pages = {12-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/599659/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

