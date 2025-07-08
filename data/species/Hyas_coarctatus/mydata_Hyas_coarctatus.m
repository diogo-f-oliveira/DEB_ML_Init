function [data, auxData, metaData, txtData, weights] = mydata_Hyas_coarctatus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Oregoniidae';
metaData.species    = 'Hyas_coarctatus'; 
metaData.species_en = 'Arctic lyre crab'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0bMcb', 'bjMp', 'jiMcb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap', 'am', 'Lj', 'Lp', 'Li', 'Wdb', 'Wdj', 'Wwp', 'Wwi', 'Eb', 'Ej', 'Ri'}; 
metaData.data_1     = {'t-L', 'T-aj'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 09 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 14]; 

%% set data
% zero-variate data

data.tp = 300;  units.tp = 'd';    label.tp = 'time since settle at puberty';  bibkey.tp = 'HartBray2001';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;  units.tpm = 'd';    label.tpm = 'time since settle at puberty';  bibkey.tpm = 'HartBray2001';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Chionoecetes opilio';
  
data.Lp  = 0.9;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'HartBray2001';
data.Lpm  = 1.1;  units.Lpm  = 'cm';  label.Lpm  = 'carapace length at puberty'; bibkey.Lpm  = 'HartBray2001';
data.Lim  = 6.1;  units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'Wiki';

data.Wdb = 31.8e-6; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';       bibkey.Wdb = 'Ange1984';
data.Wdj = 261e-6;  units.Wdj = 'g';   label.Wdj = 'dry weight at metam';       bibkey.Wdj = 'Ange1984';
data.Wwp = 0.41;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'HartBray2001';
  comment.Wwp = 'Computed as (Lp/ Lim)^3 * Wwim';
data.Wwpm = 0.72;    units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';  bibkey.Wwpm = 'HartBray2001';
  comment.Wwpm = 'Computed as (Lp/ Li)^3 * Wwim';
data.Wwim = 128;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';    bibkey.Wwim = {'Wiki','RobiGree2010'};
  comment.Wwim = 'based on 10^(-2.843 + 2.773*log10(61)), see F1';

data.Eb = 0.55; units.Eb = 'J';   label.Eb = 'energy content at birth';       bibkey.Eb = 'Ange1984';
data.Ej = 3.65; units.Ej = 'J';   label.Ej = 'energy content at metam';       bibkey.Ej = 'Ange1984';

data.Ri  = 8.53e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';  
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on same relative fecundity as Chionoecetes opilio: 1.5e5 * 128/2.25e3';

% univariate data
% t-L data
% females
data.tL_f = [ ... % time since settle (yr), carapace length (cm)
0.474	0.263
0.552	0.391
0.617	0.495
0.688	0.654
0.775	0.899
0.881	1.162
1.034	1.560
1.238	2.062
1.485	2.717]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since settle', 'carapace length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HartBray2001';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since settle (yr), carapace length (cm)
0.489	0.259
0.591	0.374
0.690	0.469
0.810	0.652
0.927	0.835
1.068	1.086
1.217	1.478
1.394	2.020
1.616	2.703
1.861	3.637]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since settle', 'carapace length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HartBray2001';
comment.tL_m = 'Data for males';
  
% T-tj data
data.Ttj = [ ... % temperature (C), time since birth to settle (d)
 6 108.7
 9  68.0
12  46.3
15  36.5
18  30.0]; 
units.Ttj   = {'C', 'd'};  label.Ttj = {'temperature', 'time since birth at settle'};  
bibkey.Ttj = 'Ange1984';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: log10 (wet weight in g)= -2.843 + 2.773*log10(carapace width in mm)';
metaData.bibkey.F1 = 'RobiGree2010'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3MXL9'; % Cat of Life
metaData.links.id_ITIS = '98423'; % ITIS
metaData.links.id_EoL = '46508042'; % Ency of Life
metaData.links.id_Wiki = 'Hyas_coarctatus'; % Wikipedia
metaData.links.id_ADW = 'Hyas_coarctatus'; % ADW
metaData.links.id_Taxo = '415721'; % Taxonomicon
metaData.links.id_WoRMS = '107323'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyas_coarctatus}}';
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
bibkey = 'GrosKona2017'; type = 'Article'; bib = [ ... 
'author = {J. Gro{\ss} and B. Konara and T. Brey and J. M. Grebmeierc}, ' ... 
'year = {2017}, ' ...
'title = {Size-frequency distribution, growth, and mortality of snow crab (\emph{Chionoecetes opilio}) and {A}rctic lyre crab (\emph{Hyas coarctatus}) in the {C}hukchi {S}ea from 2009 to 2013}, ' ...
'journal = {Deep-Sea Research Part II}, ' ...
'doi = {10.1016/j.dsr2.2017.04.021}, ' , ...
'note = {to appear}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HartBray2001'; type = 'Article'; bib = [ ... 
'author = {R. G. Hartnoll and A. D. Bryant}, ' ... 
'year = {2001}, ' ...
'title = {Growth to maturity of juveniles of the spider crabs \emph{Hyas coarctatus} {L}each and \emph{Inachus dorsettensis} ({P}ennant) ({B}rachyura: {M}ajidae}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {263}, ' , ...
'pages = {143-158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ange1984'; type = 'Article'; bib = [ ... 
'author = {K. Anger}, ' ... 
'year = {1984}, ' ...
'title = {Development and growth in larval and juvenile \emph{Hyas coarctatus} ({D}ecapoda, {M}ajidae) reared in the laboratory}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {19}, ', ...
'pages = {115--123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobiGree2010'; type = 'Article'; bib = [ ... 
'author = {L. A. Robinson and S. P. R. Greenstreet and H. Reiss and R. Callaway and J. Craeymeersch and I. de Boois and S. Degraer and S. Ehrich and H. M. Fraser and A. Goffin and I. Kroncke and L. L. Jorgenson and M. R. Robertson and J. Lancaster}, ' ... 
'year = {2010}, ' ...
'title = {Length-weight relationships of 216 {N}orth {S}ea benthic invertebrates and fish}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {90}, ' , ...
'pages = {95-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

