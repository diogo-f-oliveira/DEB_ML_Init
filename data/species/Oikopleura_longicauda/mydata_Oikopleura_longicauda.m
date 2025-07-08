function [data, auxData, metaData, txtData, weights] = mydata_Oikopleura_longicauda

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Appendicularia'; 
metaData.order      = 'Copelata'; 
metaData.family     = 'Oikopleuridae';
metaData.species    = 'Oikopleura_longicauda'; 
metaData.species_en = 'Sea-squirt'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPn'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-LR'; 't-Wd'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2011 10 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 11]; 

%% set data
% zero-variate data;
data.ab = 0.33;units.ab = 'd';  label.ab = 'age at birth';   bibkey.ab = {'FenaGors1983'};    
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8; units.am = 'd';    label.am = 'life span';      bibkey.am = {'FenaGors1983'};   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

% reproduction (copy from mydata_Oikopleura_dioica)
data.NR  = 164.63; units.NR  = '#'; label.NR  = 'total number of eggs at death';  bibkey.NR  = 'LombScia2009';   
  temp.NR = C2K(15); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
% age (d); true trunk length; total trunk length (mum); dry weight (mug)
aLRW = [0.00000  119.99899  119.99899  0.40006;
        0.75000  219.99815  229.99807  1.02003;
        1.58332  290.00218  320.00193  2.52005;
        2.83333  370.00151  440.00092  4.89992;
        4.08335  450.00084  559.99992  7.93993;
        4.91667  500.00042  639.99925 12.12990;
        6.16668  559.99992  750.00294 18.97991;
        7.20833  599.99958 1060.00034 45.01988];
aLRW(:,[2 3]) = .0001 * aLRW(:,[2 3]); % convert mum to cm
%
data.aL = aLRW(:,[1 2]);
units.aL = {'d', 'cm'};     label.aL = {'time since birth', 'trunc length'};  bibkey.aL = 'FenaGors1983';
  temp.aL = C2K(20);  units.temp.aL = 'K'; label.temp.aL = 'temperature';
%
data.aLR = aLRW(:,[1 3]);
units.aLR = {'d', 'cm'};     label.aLR = {'time since birth', 'total trunc length'};  bibkey.aLR = 'FenaGors1983';
  temp.aLR = C2K(20); units.temp.aLR = 'K'; label.temp.aLR = 'temperature';
%
data.aWd = aLRW(:,[1 4]);
units.aWd = {'d', 'mug'};     label.aWd = {'time since birth', 'dry weight'};  bibkey.aWd = 'FenaGors1983';
  temp.aWd = C2K(20); units.temp.aWd = 'K'; label.temp.aWd = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.aL = 50 * weights.aL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 10 * weights.psd.kap;

%% Discussion
D1 = 'Reprod buffer builds up on trunk, so the basis growth with L^2, and contribution to total trunc length with N/L^2';
D2 = 'Allocation to reproduction starts at birth, so E_Hp = E_Hb';
D3 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3);

%% Facts
F1 = 'Produces a new house each 2 h (marine snow)';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'dies at first spawning';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '48ZWZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '512485'; % Ency of Life
metaData.links.id_Wiki = 'Oikopleura'; % Wikipedia
metaData.links.id_ADW = 'Oikopleura_longicauda'; % ADW
metaData.links.id_Taxo = '887227'; % Taxonomicon
metaData.links.id_WoRMS = '103414'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oikopleura}}';   
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
bibkey = 'FenaGors1983'; type = 'Article'; bib = [ ... 
'author = {Fenaux, R. and Gorsky, G.}, ' ...
'year = {1983}, ' ...
'title  = {Cycle vital et croissance de l''appendiculaire \emph{Oikopleura longicauda}}, ' ...
'journal = {Annu. Inst. Oceanogr.}, ' ...
'volume = {59}, ' ...
'pages = {107--116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LombScia2009'; type = 'Article'; bib = [ ... 
'author = {Lombard, F. and Sciandra, A. and Gorsky., G.}, ' ...
'year = {2009}, ' ...
'title  = {Appendicularians ecophysiology. II. {R}eproducing clearance, growth, respiration and particles production of the appendicularian \emph{Oikopleura dioica} by modeling its ecophysiology}, ' ...
'journal = {Journal of Marine Systems}, ' ...
'volume = {78}, ' ...
'pages = {617--629}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

